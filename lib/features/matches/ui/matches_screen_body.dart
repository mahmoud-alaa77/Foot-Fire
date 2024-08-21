import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/features/matches/logic/cubit/match_cubit.dart';
import 'package:foot_fire/features/matches/ui/widgets/match_card_item.dart';

class MatchesScreenBody extends StatelessWidget {
  const MatchesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchCubit, MatchState>(
      builder: (context, state) {
        if (state is MatchesListLoaded) {
          return ListView.builder(
            itemCount: state.matchModel.events?.length?? 0,
            
            itemBuilder: (context, index) {
              return  MatchCardItem(event: state.matchModel.events![index],);
            },
          );
        } else if (state is MatchesListFailure) {
          return Center(child: Text(state.error));
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.orangeColor,
            ),
          );
        }
      },
    );
  }
}
