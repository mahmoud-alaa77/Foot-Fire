import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class MatchCardItem extends StatelessWidget {
  const MatchCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
      margin:
          const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      height: 160.h,
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
                      imageUrl:
                          "https://www.thesportsdb.com/images/media/team/badge/xzqdr11517660252.png",
                      width: 45.w,
                      height: 45.h,
                    ),
                    verticalSpace(6),
                    const Text(
                      "Manchester United",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("24-8-2024"),
                    verticalSpace(6),
                    const Text("10:30:00"),
                    verticalSpace(16),
                    // Text(
                    //   "Not Started",
                    //   style: AppTextStyles.font14OrangeW400,
                    // ),
                    Text(
                      "Full Time",
                      style: AppTextStyles.font14OrangeW400,
                    ),
                    verticalSpace(6),
                    Text(
                      "6  -  4",
                      style: AppTextStyles.font14OrangeW400,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "https://www.thesportsdb.com/images/media/team/badge/xwwvyt1448811086.png",
                      width: 45.w,
                      height: 45.h,
                    ),
                    verticalSpace(6),
                    const Text("Fulham", textAlign: TextAlign.center)
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🏟 Emirates Stadium", style: AppTextStyles.font14GreyW400,
                //textAlign: TextAlign.center,
              ),
              Text(
                "Round 1", style: AppTextStyles.font14GreyW400,
                //textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
