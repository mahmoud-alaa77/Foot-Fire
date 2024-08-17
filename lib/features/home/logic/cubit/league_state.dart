part of 'league_cubit.dart';

sealed class LeagueState {}

final class LeagueInitial extends LeagueState {}

final class LeaguesListLoading extends LeagueState {}

final class LeaguesListLoaded extends LeagueState {
  final LeagueModel leaguesList;

   LeaguesListLoaded({required this.leaguesList });
}

final class LeaguesListFailure extends LeagueState {
  final String errorMessage;

   LeaguesListFailure({required this.errorMessage });
}


