import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/features/favorites/data/models/favorite_item_mode.dart';
import 'package:foot_fire/features/favorites/data/repos/favorites_repo.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo _favoritesRepo;
  FavoritesCubit(this._favoritesRepo) : super(FavoritesInitial());

  bool filterAllItemsButton = true;
  bool filterTeamButton = false;
  bool filterPlayerButton = false;

  getFavoritesAfterFilter() {
    if (filterAllItemsButton == true) {
      getAllFavoriteItems();
    } else if (filterTeamButton == true) {
      getFavoriteTeams();
    } else {
      getFavoritePlayers();
    }
  }

  getAllFavoriteItems() async {
    emit(FavoritesLoading());

    var result = await _favoritesRepo.getAllFavoriteItems();

    result.fold((failure) {
      emit(FavoritesError(error: failure.errorMessage));
    }, (items) {
      emit(AllFavoritesItemsLoaded(items: items ?? []));
    });
  }

  getFavoritePlayers() async {
    emit(FavoritesLoading());

    var result = await _favoritesRepo.getFavoritePlayers();

    result.fold((failure) {
      emit(FavoritesError(error: failure.errorMessage));
    }, (items) {
      emit(FavoritesPlayersLoaded(items: items ?? []));
    });
  }

  getFavoriteTeams() async {
    emit(FavoritesLoading());

    var result = await _favoritesRepo.getFavoriteTeams();

    result.fold((failure) {
      emit(FavoritesError(error: failure.errorMessage));
    }, (items) {
      emit(FavoritesTeamsLoaded(items: items ?? []));
    });
  }

  checkIsFavoriteOrNot(String title) async {
    emit(FavoritesLoading());
    var response = await _favoritesRepo.checkIsFavoriteOrNot(title);
    response.fold((failure) {
      emit(FavoritesError(error: "Please try later !"));
    }, (isFavorite) {
      emit(IsFavoriteState(isFavorite: isFavorite));
    });
  }
}
