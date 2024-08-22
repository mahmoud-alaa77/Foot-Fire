import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/features/league_teams/logic/cubit/team_cubit.dart';
import 'package:foot_fire/features/league_teams/ui/widgets/team_list_item.dart';

class TeamsScreenBody extends StatelessWidget {
  const TeamsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamCubit, TeamState>(
      builder: (context, state) {
        if (state is TeamsListLoaded) {
          return GridView.builder(
            padding: const EdgeInsets.only(top: 12,left: 8,right: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: state.teamMembers.teams?.length ?? 0,
              itemBuilder: (context, index) {
                return  TeamListItem(
                  team: state.teamMembers.teams![index],
                );
              });
        } else if (state is TeamsListFailure) {
          return Center(
            child: Text(state.error),
          );
        }else{
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.orangeColor,
          ));
        }
      },
    );
  }
}
