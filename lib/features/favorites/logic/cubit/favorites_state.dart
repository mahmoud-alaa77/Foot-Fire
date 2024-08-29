part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class AllFavoritesItemsLoaded extends FavoritesState {
  final List<FavoriteItemModel> items;

  AllFavoritesItemsLoaded({required this.items});
}


final class FavoritesPlayersLoaded extends FavoritesState {
  final List<FavoriteItemModel> items;

  FavoritesPlayersLoaded({required this.items});
}

final class FavoritesTeamsLoaded extends FavoritesState {
  final List<FavoriteItemModel> items;

  FavoritesTeamsLoaded({required this.items});
}
final class FavoritesError extends FavoritesState {
  final String error;

  FavoritesError({required this.error});
}

final class FavoritesLoading extends FavoritesState {}

final class IsFavoriteState extends FavoritesState {
  final bool isFavorite;
  IsFavoriteState({required this.isFavorite});
}
