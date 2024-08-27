import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/player_profile/data/models/honour_model.dart';

class HonourListItem extends StatelessWidget {
  final Honour honour;
  final int index;
  const HonourListItem({super.key, required this.honour, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15.r,
          backgroundColor: AppColors.lightGrayColor,
          child: Text(index.toString()),
        ),
        horizontalSpace(6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                honour.strHonour ?? "",
                style: AppTextStyles.font14OrangeW400.copyWith(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,              
              ),
              Text("${honour.strTeam} (${honour.strSeason})",style: AppTextStyles.font14GreyW400,)
            ],
          ),
        ),
      ],
    );
  }
}
