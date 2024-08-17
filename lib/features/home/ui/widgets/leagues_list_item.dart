import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class LeaguesListItem extends StatelessWidget {
  final String title;
  final String leagueImageUrl;
  const LeaguesListItem({
    super.key, required this.title, required this.leagueImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl:
                leagueImageUrl,
            width: 35.w,
            height: 35.h,
          ),
          horizontalSpace(8),
          Flexible(
            child: Text(
             title,
              style: AppTextStyles.font16WhiteW500,
            ),
          ),
        ],
      ),
    );
  }
}
