part of 'team_cubit.dart';

sealed class TeamState {}

final class TeamInitial extends TeamState {}

final class TeamsListLoading extends TeamState {}

final class TeamsListLoaded extends TeamState {
  final TeamModel teamMembers;

  TeamsListLoaded({required this.teamMembers });
}

final class TeamsListFailure extends TeamState {
  final String error;

  TeamsListFailure({required this.error });
}
