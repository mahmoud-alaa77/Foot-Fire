import 'package:foot_fire/features/player_profile/data/models/career_model.dart';
import 'package:foot_fire/features/player_profile/data/models/honour_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/features/player_profile/data/models/player_model.dart';
import 'package:foot_fire/features/player_profile/data/repos/player_repo.dart';
import 'package:foot_fire/features/search/data/models/search_player_model.dart';
part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  final PlayerRepo _playerRepo;
  PlayerCubit(this._playerRepo) : super(PlayerInitial());

  getHonoursByPlayerId(String playerID) async {
    emit(PlayerHonourListLoading());

    var response = await _playerRepo.getHonoursByPlayerID(playerID);

    response.fold((failure) {
      emit(PlayerHonourListFailure(errorMessage: failure.errorMessage));
    }, (honourModel) {
      emit(PlayerHonourListLoaded(honours: honourModel.honours ?? []));
    });
  }

  getPlayerCareerByPlayerId(String playerID) async {
    emit(PlayerHonourListLoading());

    var response = await _playerRepo.getPlayerCareerByPlayerID(playerID);

    response.fold((failure) {
      emit(PlayerHonourListFailure(errorMessage: failure.errorMessage));
    }, (careerModel) {
      emit(PlayerCareerListLoaded(teams: careerModel.formerteams ?? []));
    });
  }

  getPlayerDetailsByID(String playerID) async {
    emit(PlayerHonourListLoading());

    var response = await _playerRepo.getPlayerDetailsByPlayerID(playerID);

    response.fold((failure) {
      emit(PlayerHonourListFailure(errorMessage: failure.errorMessage));
    }, (playerModel) {
      print(playerModel.playersList?[0].playerName);
      emit(PlayerDetailsLoaded(playerModel: playerModel));
    });
  }
}
