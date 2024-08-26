part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchPlayerLoadedSuccessful extends SearchState {
  final List<Player>? players;

  SearchPlayerLoadedSuccessful({required this.players});
}

final class SearchTeamLoadedSuccessful extends SearchState {
  final TeamModel teamModel;

  SearchTeamLoadedSuccessful({required this.teamModel});
}


final class SearchStaduimLoadedSuccessful extends SearchState {
  final List<dynamic>? staduimList;

  SearchStaduimLoadedSuccessful({required this.staduimList});
}

final class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}
