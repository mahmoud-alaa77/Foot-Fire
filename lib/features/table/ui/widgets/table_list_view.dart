import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/table/logic/cubit/table_cubit.dart';
import 'package:foot_fire/features/table/ui/widgets/table_list_item.dart';

class TableListView extends StatelessWidget {
  const TableListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child: BlocBuilder<TableCubit, TableState>(
      //buildWhen: (previous, current) => current is TableLoaded ||current is TableError ||current is TableInitial ||current is TableLoading ,
      builder: (context, state) {
        if (state is TableLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
                        var team =state.tableModel.table?[index];
              return  TableListItem(
                  rank: team?.rank ?? "",
                  teamName: team?.teamName ?? "",
                  logoTeamImage:
                      team?.badge ?? "",
                  play: team?.intPlayed ??"",
                  win:  team?.intWin ??"",
                  lose:  team?.intLoss ??"",
                  drawUp:  team?.intDraw ??"",
                  goalsFor:  team?.intGoalsFor ??"",
                  goalsAgainst:  team?.intGoalsAgainst ??"",
                  goalDifference:  team?.intGoalDifference ??"",
                  points:  team?.intPoints ??"");
            },
            itemCount: state.tableModel.table?.length ?? 0,
          );
        } else if (state is TableError) {
          return Center(
              child: Text(
            state.errorMessage,
            style: AppTextStyles.font18WhiteW700,
          ));
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.orangeColor,
          ));
        }

      },
    ));
  }
}

/*


*/