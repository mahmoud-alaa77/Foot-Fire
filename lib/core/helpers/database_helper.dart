import 'package:foot_fire/features/favorites/data/models/favorite_item_mode.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static Database? _db;

  static const String databaseName = "foot_fire.db";
  static const String favoritesTableName = "favorites";

  get db async {
    if (_db == null) {
      String path = join(await getDatabasesPath(), databaseName);
      _db = await openDatabase(path,
          version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
      return _db;
    }
    return _db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $favoritesTableName (  
        title TEXT NOT NULL,
        sub_title TEXT NOT NULL,
        image TEXT NOT NULL,
        category TEXT NOT NULL
        )
''');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('drop table $favoritesTableName');
    await _onCreate(db, newVersion);
  }

  addItemToFavorites(FavoriteItemModel item) async {
    Database clint = await db;
    await clint.insert(favoritesTableName, {
      'title': item.title,
      'sub_title': item.subTitle,
      'image': item.imageUrl,
      'category': item.category
    });
  }

  Future<List<FavoriteItemModel>?> getAllFavoriteItems() async {
    Database clint = await db;
    List<Map> favoriteItems = await clint.query(favoritesTableName,
        columns: ["title", 'sub_title', "image", 'category']);
    List<FavoriteItemModel> productsForCurrentUser = [];
    if (favoriteItems.isNotEmpty) {
      for (int i = 0; i < favoriteItems.length; i++) {
        FavoriteItemModel s = FavoriteItemModel(
            title: favoriteItems[i]['title'],
            subTitle: favoriteItems[i]['sub_title'],
            imageUrl: favoriteItems[i]['image'],
            category: favoriteItems[i]['category']);
        productsForCurrentUser.add(s);
      }
    }
    return productsForCurrentUser;
  }

Future<List<FavoriteItemModel>?> getFavoritePlayers() async {
  Database client = await db;

  // Query the database to get only items where category is "player"
  List<Map> favoritePlayers = await client.query(
    favoritesTableName,
    columns: ["title", "sub_title", "image", "category"],
    where: "category = ?",
    whereArgs: ["player"],
  );

  // Map the results to a list of FavoriteItemModel
  List<FavoriteItemModel> favoritesPlayer = favoritePlayers.map((player) {
    return FavoriteItemModel(
      title: player['title'],
      subTitle: player['sub_title'],
      imageUrl: player['image'],
      category: player['category'],
    );
  }).toList();

  return favoritesPlayer;
}
 Future<List<FavoriteItemModel>?> getFavoriteTeams() async {
  Database client = await db;

  // Query the database with a WHERE clause to filter by category "team"
  List<Map> favoriteTeams = await client.query(
    favoritesTableName,
    columns: ["title", "sub_title", "image", "category"],
    where: "category = ?",
    whereArgs: ["team"],
  );

  // Map the results to a list of FavoriteItemModel
  List<FavoriteItemModel> favoritesTeams = favoriteTeams.map((team) {
    return FavoriteItemModel(
      title: team['title'],
      subTitle: team['sub_title'],
      imageUrl: team['image'],
      category: team['category'],
    );
  }).toList();

  return favoritesTeams;
}

  Future<bool> isFavoriteItem(String itemTitle) async {
    Database clint = await db;
    List<Map<String, dynamic>> items = await clint.query(
      favoritesTableName,
      where: "title = ?",
      whereArgs: [itemTitle],
    );
    return items.isNotEmpty;
  }

  Future<int> deleteFromFavorites(String title) async {
    Database clint = await db;
    Future<int> numOfRecord =
        clint.delete(favoritesTableName, where: "title=?", whereArgs: [title]);
    return numOfRecord;
  }
}
