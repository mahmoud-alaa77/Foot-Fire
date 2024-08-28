import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/player_profile/logic/cubit/player_cubit.dart';
import 'package:foot_fire/features/player_profile/ui/widgets/career_list_item.dart';

class PlayerCareer extends StatefulWidget {
  final String playerId;
  const PlayerCareer({super.key, required this.playerId});

  @override
  State<PlayerCareer> createState() => _PlayerHonourState();
}

class _PlayerHonourState extends State<PlayerCareer> {
  bool isExpanded = false;

  void toggleHonours() async {
    setState(() {
      isExpanded = !isExpanded;
    });

    if (isExpanded == true) {
      await context
          .read<PlayerCubit>()
          .getPlayerCareerByPlayerId(widget.playerId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.darkGrayColor,
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Career",
                style: AppTextStyles.font18WhiteW400,
              ),
              IconButton(
                onPressed: toggleHonours,
                icon: Icon(
                    isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              ),
            ],
          ),
          if (isExpanded)
            BlocBuilder<PlayerCubit, PlayerState>(
              builder: (context, state) {
                if (state is PlayerCareerListLoaded) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.teams.length,
                    separatorBuilder: (context, index) => verticalSpace(12),
                    itemBuilder: (context, index) {
                      return CareerListItem(team: state.teams[index],);
                    },
                  );
                } else if (state is PlayerHonourListFailure) {
                  return Center(
                    child: Text(
                      "Failed to load any honours",
                      style: AppTextStyles.font14OrangeW400,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
        ],
      ),
    );
  }
}
