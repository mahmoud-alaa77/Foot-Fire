import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/league_teams/data/models/team_model.dart';
import 'package:foot_fire/features/search/data/models/player_model.dart';
import 'package:foot_fire/features/search/data/models/search_item.dart';
import 'package:foot_fire/features/search/data/models/staduim_model.dart';
import 'package:foot_fire/features/search/logic/cubit/search_cubit.dart';
import 'package:foot_fire/features/search/ui/widgets/no_result_found.dart';
import 'package:foot_fire/features/search/ui/widgets/search_card_item.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchPlayerLoadedSuccessful) {
            return searchPlayersListLoadedSuccess(state);
          } else if (state is SearchTeamLoadedSuccessful) {
            return searchTeamLoadedSuccess(state);
          } else if (state is SearchStaduimLoadedSuccessful) {
            return searchStaduimsListLoadedSuccess(state);
          } else if (state is SearchError) {
            return Center(child: Text(state.message));
          } else if (state is SearchInitial) {
            return const NoResultFound();
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.orangeColor,
            ));
          }
        },
      ),
    );
  }

  Widget searchStaduimsListLoadedSuccess(SearchStaduimLoadedSuccessful state) {
    return state.staduimList == null
        ? const NoResultFound()
        : ListView.builder(
            itemCount: state.staduimList?.length ?? 0,
            itemBuilder: (context, index) {
              final Staduim staduim = state.staduimList![index];
              return SearchCardItem(
                searchItem: SearchItem(staduim.idVenue,
                    title: staduim.staduimName,
                    subTitle: staduim.strCountry,
                    imageUrl: staduim.strThumb ?? MyImages.emptyImage),
              );
            },
          );
  }

  Widget searchTeamLoadedSuccess(SearchTeamLoadedSuccessful state) {
    return state.teamModel.teams == null
        ? const NoResultFound()
        : ListView.builder(
            itemCount: state.teamModel.teams?.length ?? 0,
            itemBuilder: (context, index) {
              final Team team = state.teamModel.teams![index];
              return SearchCardItem(
                searchItem: SearchItem(team.idTeam,
                    title: team.teamName,
                    subTitle: team.leagueName,
                    imageUrl: team.strBadge),
              );
            },
          );
  }

  Widget searchPlayersListLoadedSuccess(SearchPlayerLoadedSuccessful state) {
    return state.players == null
        ? const NoResultFound()
        : ListView.builder(
            itemCount: state.players?.length ?? 0,
            itemBuilder: (context, index) {
              final Player player = state.players![index];
              return SearchCardItem(
                searchItem: SearchItem(player.idPlayer,
                    title: player.playerName,
                    subTitle: player.teamName,
                    imageUrl: player.strThumb),
              );
            },
          );
  }
}

