part of 'player_cubit.dart';

sealed class PlayerState {}

final class PlayerInitial extends PlayerState {}

class PlayerHonourListLoaded extends PlayerState {
  final List<Honour> honours;
  PlayerHonourListLoaded({required this.honours});
}

class PlayerHonourListLoading extends PlayerState {}

class PlayerHonourListFailure extends PlayerState {
  final String errorMessage;
  PlayerHonourListFailure({required this.errorMessage});
}

class PlayerCareerListLoaded extends PlayerState {
  final List<Formerteam> teams;
  PlayerCareerListLoaded({required this.teams});
}

class PlayerDetailsLoaded extends PlayerState {
  final PlayerModel playerModel;
  PlayerDetailsLoaded({required this.playerModel});
}
