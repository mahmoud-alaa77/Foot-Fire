import 'package:flutter/material.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class FilterItemButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color borderColor;
  const FilterItemButton({
    super.key,
    required this.title,
    this.onTap,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.orangeColor.withOpacity(.8),
            border: Border.all(color: borderColor)),
        child: Center(
            child: Text(
          title,
          style: AppTextStyles.font16BlackW300,
        )),
      ),
    );
  }
}
