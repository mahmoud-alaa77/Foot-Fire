import 'package:foot_fire/features/league_matches/data/models/match_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/features/league_matches/data/repos/match_repo.dart';
part 'match_state.dart';

class MatchCubit extends Cubit<MatchState> {
  final MatchRepo _matchRepo;
  MatchCubit(this._matchRepo) : super(MatchInitial());

  getTableForLeague(String leagueId, String season) async {
    emit(MatchesListLoading());

    var result = await _matchRepo.getAllMatches(leagueId, season);
    result.fold((failure) {
      emit(MatchesListFailure(error: failure.errorMessage));
    }, (matchModel) {
      emit(MatchesListLoaded(matchModel: matchModel));
    });
  }
}
