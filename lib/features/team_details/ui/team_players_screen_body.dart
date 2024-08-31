import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/features/league_teams/ui/widgets/team_list_item.dart';
import 'package:foot_fire/features/team_details/logic/cubit/all_players_cubit.dart';
import 'package:foot_fire/features/team_details/ui/widgets/player_list_item.dart';

class TeamPlayersScreenBody extends StatelessWidget {
  const TeamPlayersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllPlayersCubit, AllPlayersState>(
      builder: (context, state) {
        if (state is AllPlayersLoaded) {
         return GridView.builder(
            padding: const EdgeInsets.only(top: 12,left: 8,right: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: state.players.length ,
              itemBuilder: (context, index) {
                return  PlayerListItem(
                  player: state.players[index],
                );
              });
        }else{
          return Text("Loading...");
        }
      },
    );
  }
}
