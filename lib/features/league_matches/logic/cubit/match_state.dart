part of 'match_cubit.dart';

sealed class MatchState {}

final class MatchInitial extends MatchState {}

final class MatchesListLoading extends MatchState {}

final class MatchesListLoaded extends MatchState {
  final MatchModel matchModel;
  MatchesListLoaded({required this.matchModel});
}

final class MatchesListFailure extends MatchState {
  final String error;
  MatchesListFailure({required this.error});
}
