part of 'all_players_cubit.dart';

sealed class AllPlayersState {}

final class AllPlayersInitial extends AllPlayersState {}

class AllPlayersLoaded extends AllPlayersState {
  final List<Player> players;
  AllPlayersLoaded({required this.players});
}

class AllPlayersError extends AllPlayersState {
  final String error;
  AllPlayersError({required this.error});
}

class AllPlayersLoading extends AllPlayersState {}
