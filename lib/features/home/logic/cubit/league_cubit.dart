import 'package:foot_fire/features/home/data/models/league_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/features/home/data/repos/home_repo.dart';

part 'league_state.dart';

class LeagueCubit extends Cubit<LeagueState> {
  final HomeRepo _homeRepo;
  LeagueCubit(this._homeRepo) : super(LeagueInitial());

  getAllLeaguesByCountryName(String countryName) async {
    emit(LeaguesListLoading());

    var result = await _homeRepo.getAllLeaguesByCountryName(countryName);

    result.fold((failure) {
      emit(LeaguesListFailure(errorMessage: failure.errorMessage));
    }, (leaguesList) {
      emit(LeaguesListLoaded(leaguesList: leaguesList));
    });
  }
}
