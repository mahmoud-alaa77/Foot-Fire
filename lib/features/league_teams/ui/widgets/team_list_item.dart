import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/league_teams/data/models/team_model.dart';

class TeamListItem extends StatelessWidget {
  final Team team;
  const TeamListItem({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.darkGrayColor.withOpacity(.5),
      ),
      margin:
          const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl:
                team.strBadge ?? MyImages.emptyImage,
            width: 80.w,
            height: 80.h,
          ),
          verticalSpace(12),
          Flexible(
            child: Text(
              team.teamName ?? "--",
              style: AppTextStyles.font18WhiteW700,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            team.shortName ?? "",
            style: AppTextStyles.font14OrangeW400,
          )
        ],
      ),
    );
  }
}
