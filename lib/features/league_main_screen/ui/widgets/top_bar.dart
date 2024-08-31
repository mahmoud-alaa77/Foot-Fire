import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/extentions.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class TopBar extends StatelessWidget {
  final String leagueName;
  final String countryName;
  final String leagueLogo;
  final String currentSeason;
  const TopBar({
    super.key,
    required this.leagueName,
    required this.countryName,
    required this.leagueLogo,
    required this.currentSeason,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30.r,
                )),
            horizontalSpace(10),
            Text(
              currentSeason,
              style: AppTextStyles.font14OrangeW400,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            horizontalSpace(40),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: leagueLogo,
                width: 60.w,
                height: 60.h,
                fit: BoxFit.fill,
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    leagueName,
                    style: AppTextStyles.font18WhiteW700,
                    maxLines: 2,
                  ),
                  verticalSpace(10),
                  Text(countryName, style: AppTextStyles.font16WhiteW500),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
