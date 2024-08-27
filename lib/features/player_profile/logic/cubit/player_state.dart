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
