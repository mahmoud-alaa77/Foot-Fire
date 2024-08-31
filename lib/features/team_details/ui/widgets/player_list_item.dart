

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/extentions.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/routing/routes.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/search/data/models/player_model.dart';

class PlayerListItem extends StatelessWidget {
  final Player player;
  const PlayerListItem({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.playerProfile,arguments: player);
      },
      child: Container(
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
              imageUrl: player.strCutout ?? player.strThumb ?? MyImages.unKnownPersonImage,
              width: 80.w,
              height: 80.h,
            ),
            verticalSpace(12),
            Flexible(
              child: Text(
               "${ player.playerName ?? "--"}(${player.playerNumber?? ""})",
                style: AppTextStyles.font16WhiteW500,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              player.playerNationality ?? "--",
              style: AppTextStyles.font14OrangeW400,
            )
          ],
        ),
      ),
    );
  }
}