import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class MoreDetailsWidget extends StatelessWidget {
  final String keyText;
  final String valueText;

  const MoreDetailsWidget({
    super.key,
    required this.keyText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          keyText,
          style: AppTextStyles.font14GreyW400,
        ),
        horizontalSpace(6),
        Container(
          padding:
              const EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.orangeColor),
          child: Text(valueText,style: AppTextStyles.font16BlackW300,),
        )
      ],
    );
  }
}
