import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class LeaguesListItem extends StatelessWidget {
  const LeaguesListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(
            "https://www.thesportsdb.com/images/media/league/badge/dsnjpz1679951317.png",
            width: 35.w,
            height: 35.h,
          ),
          horizontalSpace(8),
          Flexible(
            child: Text(
              "English Premier League",
              style: AppTextStyles.font16WhiteW500,
            ),
          ),
        ],
      ),
    );
  }
}
