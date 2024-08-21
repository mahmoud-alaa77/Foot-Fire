import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class TeamListItem extends StatelessWidget {
  const TeamListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.darkGrayColor.withOpacity(.5),
      ),
      margin:
          const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://www.thesportsdb.com/images/media/team/badge/grv1aw1546453779.png",
            width: 80.w,
            height: 80.h,
          ),
          verticalSpace(12),
          Flexible(
            child: Text(
              "Manchester City",
              style: AppTextStyles.font18WhiteW700,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "(BRE)",
            style: AppTextStyles.font14OrangeW400,
          )
        ],
      ),
    );
  }
}
