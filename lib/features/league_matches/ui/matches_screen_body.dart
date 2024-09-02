import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/league_matches/logic/cubit/match_cubit.dart';
import 'package:foot_fire/features/league_matches/ui/widgets/match_card_item.dart';

class MatchesScreenBody extends StatelessWidget {
  const MatchesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchCubit, MatchState>(
      builder: (context, state) {
        if (state is MatchesListLoaded) {
          return ListView.separated(
            separatorBuilder: (context, index) {
              if (state.matchModel.events![index].intRound !=
                  state.matchModel.events![index + 1].intRound) {
                return buildSeparatedCotainer(state, index);
              } else {
                return const SizedBox.shrink();
              }
            },
            itemCount: state.matchModel.events?.length ?? 0,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: [
                    verticalSpace(8),
                    buildSeparatedCotainer(state, 0),
                    MatchCardItem(
                      event: state.matchModel.events![index],
                    )
                  ],
                );
              }
              return MatchCardItem(
                event: state.matchModel.events![index],
              );
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

  Container buildSeparatedCotainer(MatchesListLoaded state, int index) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 6),
      margin:
          const EdgeInsetsDirectional.symmetric(vertical: 6, horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.orangeColor,
      ),
      child: Center(
          child: Text(
        "Round ${state.matchModel.events![index + 1].intRound.toString()}",
        style: AppTextStyles.font16BlackW300,
      )),
    );
  }
}
