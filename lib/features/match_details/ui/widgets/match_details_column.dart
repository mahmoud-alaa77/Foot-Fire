import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/helper_functions.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/league_matches/data/models/match_model.dart';

class MatchDetailsColumn extends StatelessWidget {
  final Event event;
  const MatchDetailsColumn({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "    🏟 ${event.strVenue}",
          style: AppTextStyles.font16GreyW400,
        ),
        verticalSpace(12),
        Text(
          "    🔄 Round ${event.intRound}",
          style: AppTextStyles.font16GreyW400,
        ),
        verticalSpace(12),
        Text(
          "    🗺️ ${event.strCountry}",
          style: AppTextStyles.font16GreyW400,
        ),
        verticalSpace(16),
        Text(
          "    📅 ${event.dateEventLocal ??"---"} / ${event.strTimeLocal != null ? HelperFunctions().convertTo12HourFormat(event.strTimeLocal.toString()) : "---"}",
          style: AppTextStyles.font16GreyW400,
        ),
      ],
    );
  }
}
