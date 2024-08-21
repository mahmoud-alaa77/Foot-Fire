import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/helper_functions.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/matches/data/models/match_model.dart';

class MatchCardItem extends StatelessWidget {
  final Event event;
  const MatchCardItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
      margin:
          const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      //height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.orangeColor, width: .5),
        color: AppColors.darkGrayColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.orangeColor.withOpacity(.2),
            offset: const Offset(0, 4.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: event.strHomeTeamBadge ?? MyImages.emptyImage,
                      width: 45.w,
                      height: 45.h,
                    ),
                    verticalSpace(6),
                    Text(
                      event.strHomeTeam ?? "---",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      event.dateEventLocal ?? "---",
                    ),
                    verticalSpace(6),
                    Text(
                      event.strTimeLocal != null ?
                      HelperFunctions().convertTo12HourFormat(event.strTimeLocal.toString()) : "---",
                    ),
                    verticalSpace(16),
                    Text(
                      event.strStatus == "Match Finished"
                          ? "Full Time"
                          : event.strStatus ?? "Unknown",
                      style: AppTextStyles.font14OrangeW400,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(6),
                    event.strStatus == "Not Started"
                        ? const Text("")
                        : Text(
                            "${event.homeTeamScore ?? "*"}  -  ${event.awayTeamScore ?? "*"}",
                            style: AppTextStyles.font14OrangeW400,
                          ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: event.strAwayTeamBadge ?? MyImages.emptyImage,
                      width: 45.w,
                      height: 45.h,
                    ),
                    verticalSpace(6),
                    Text(event.strAwayTeam ?? "---",
                        textAlign: TextAlign.center)
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "🏟 ${event.strVenue}",
                  style: AppTextStyles.font14GreyW400,
                ),
              ),
              Text(
                "Round ${event.intRound}",
                style: AppTextStyles.font14GreyW400,
              ),
            ],
          )
        ],
      ),
    );
  }
}
