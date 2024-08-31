import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/features/search/data/models/player_model.dart';
import 'package:foot_fire/features/team_details/data/repos/all_players_repo.dart';

part 'all_players_state.dart';

class AllPlayersCubit extends Cubit<AllPlayersState> {
  final AllPlayersRepo _allPlayersRepo;
  AllPlayersCubit(this._allPlayersRepo) : super(AllPlayersInitial());

  getAllPlayers(String teamID) async {
    emit(AllPlayersLoading());

    var response = await _allPlayersRepo.getAllPlayersInTeam(teamID);
    response.fold((failure) {
      emit(AllPlayersError(error: failure.errorMessage));
    }, (playerModel) {
      emit(AllPlayersLoaded(players: playerModel.playersList ?? []));
    });
  }
}
