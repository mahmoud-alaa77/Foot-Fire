import 'package:foot_fire/features/league_teams/data/models/team_model.dart';
import 'package:foot_fire/features/search/data/models/search_player_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/features/search/data/models/staduim_model.dart';
import 'package:foot_fire/features/search/data/repos/search_repo.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(SearchInitial());

  bool searchPlayerButton = true;
  bool searchTeamFullNameButton = false;
  bool searchTeamShortNameButton = false;

  bool searchStaduimButton = false;

  search(String searchValue) {
    if (searchPlayerButton == true) {
      searchByPlayer(searchValue);
    } else if (searchTeamFullNameButton == true) {
      searchByTeamFullName(searchValue);
    } else if (searchTeamShortNameButton == true) {
      searchByTeamShortName(searchValue);
    } else {
      searchByStadium(searchValue);
    }
  }

  searchByPlayer(String playerName) async {
    emit(SearchLoading());

    var result = await _searchRepo.searchByPlayer(playerName);

    result.fold((failure) {
      emit(SearchError(message: failure.errorMessage));
    }, (searchItem) {
      List<SearchPlayer> footballPlayers =
          onlyFootBallPlayer(searchItem.playersList ?? []);
      emit(SearchPlayerLoadedSuccessful(players: footballPlayers));
    });
  }

  onlyFootBallPlayer(List<SearchPlayer> players) {
    List<SearchPlayer> footballPlayers = [];

    for (int i = 0; i < players.length; i++) {
      if (players[i].sportName == 'Soccer') {
        footballPlayers.add(players[i]);
      }
    }
    return footballPlayers;
  }

  searchByTeamFullName(String teamName) async {
    emit(SearchLoading());

    var result = await _searchRepo.searchByTeamFullName(teamName);

    result.fold((failure) {
      emit(SearchError(message: failure.errorMessage));
    }, (searchItem) {
      emit(SearchTeamLoadedSuccessful(teamModel: searchItem));
    });
  }

  searchByTeamShortName(String teamName) async {
    emit(SearchLoading());

    var result = await _searchRepo.searchByTeamShortName(teamName);

    result.fold((failure) {
      emit(SearchError(message: failure.errorMessage));
    }, (searchItem) {
      emit(SearchTeamLoadedSuccessful(teamModel: searchItem));
    });
  }

  searchByStadium(String staduimName) async {
    emit(SearchLoading());

    var result = await _searchRepo.searchByStaduimName(staduimName);

    result.fold((failure) {
      emit(SearchError(message: failure.errorMessage));
    }, (searchItem) {
      List<dynamic> footballStaduims =
          onlyFootBallStaduim(searchItem.venues ?? []);

      emit(SearchStaduimLoadedSuccessful(staduimList: footballStaduims));
    });
  }

  onlyFootBallStaduim(List<Staduim> staduims) {
    List<dynamic> footballStaduims = [];

    for (int i = 0; i < staduims.length; i++) {
      if (staduims[i].strSport == 'Soccer') {
        footballStaduims.add(staduims[i]);
      }
    }
    return footballStaduims;
  }
}
