import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/league_matches/data/models/match_model.dart';

class ScoreBoard extends StatelessWidget {
  final Event event;
  const ScoreBoard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: event.strHomeTeamBadge ?? MyImages.emptyImage,
                width: 100.w,
                height: 100.h,
              ),
              verticalSpace(10),
              Text(
                event.strHomeTeam ?? "---",
                style: AppTextStyles.font18WhiteW400,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              verticalSpace(16),
              Text(
                event.strStatus == "Match Finished"
                    ? "Full Time"
                    : event.strStatus ?? "Unknown",
                style: AppTextStyles.font18OrangeW400,
                textAlign: TextAlign.center,
              ),
              verticalSpace(6),
              event.strStatus == "Not Started"
                  ? const Text("")
                  : Text(
                      "${event.homeTeamScore ?? "*"}  -  ${event.awayTeamScore ?? "*"}",
                      style: AppTextStyles.font18OrangeW400,
                    ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: event.strAwayTeamBadge ?? MyImages.emptyImage,
                width: 100.w,
                height: 100.h,
              ),
              verticalSpace(10),
              Text(event.strAwayTeam ?? "---",
                  style: AppTextStyles.font18WhiteW400,
                  textAlign: TextAlign.center)
            ],
          ),
        ),
      ],
    );
  }
}
