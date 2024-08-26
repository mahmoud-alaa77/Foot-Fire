import 'package:flutter/material.dart';
import 'package:foot_fire/core/theming/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.lightGrayColor,
      height: 28,
      thickness: .5,
      endIndent: 16,
      indent: 16,
    );
  }
}
