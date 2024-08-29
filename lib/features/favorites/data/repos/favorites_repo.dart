import 'package:dartz/dartz.dart';
import 'package:foot_fire/core/errors/failure.dart';
import 'package:foot_fire/core/helpers/database_helper.dart';
import 'package:foot_fire/features/favorites/data/models/favorite_item_mode.dart';

class FavoritesRepo {
  final DataBaseHelper _baseHelper;

  FavoritesRepo(this._baseHelper);

  Future<Either<Failure, List<FavoriteItemModel>?>>
      getAllFavoriteItems() async {
    try {
      var items = await _baseHelper.getAllFavoriteItems();
      return Right(items);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  Future<Either<Failure, List<FavoriteItemModel>?>> getFavoritePlayers() async {
    try {
      var items = await _baseHelper.getFavoritePlayers();
      return Right(items);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  Future<Either<Failure, List<FavoriteItemModel>?>> getFavoriteTeams() async {
    try {
      var items = await _baseHelper.getFavoriteTeams();
      return Right(items);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  checkIsFavoriteOrNot(String title) async {
    try {
      final item = await _baseHelper.isFavoriteItem(title);
      return Right(item);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }
}
