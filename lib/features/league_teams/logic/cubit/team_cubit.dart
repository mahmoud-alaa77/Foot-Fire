import 'package:foot_fire/features/league_teams/data/models/shirt_model.dart';
import 'package:foot_fire/features/league_teams/data/models/team_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/features/league_teams/data/repos/team_repo.dart';
part 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  final TeamRepo _teamRepo;
  TeamCubit(this._teamRepo) : super(TeamInitial());

  getTeamsInLeague(String leagueName) async {
    emit(TeamsListLoading());

    var result = await _teamRepo.getTeams(leagueName);
    result.fold((failure) {
      emit(TeamsListFailure(error: failure.errorMessage));
    }, (teams) {
      emit(TeamsListLoaded(teamMembers: teams));
    });
  }

  getShirtByTeamID(String teamID) async {
    emit(TeamsListLoading());

    var result = await _teamRepo.getShirtByTeamID(teamID);
    result.fold((failure) {
      emit(TeamsListFailure(error: failure.errorMessage));
    }, (shirtModel) {
      emit(TeamShirtsLoaded(shirtsList: shirtModel.shirts ?? []));
    });
  }
}
