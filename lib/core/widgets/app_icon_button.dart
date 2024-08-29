

import 'package:flutter/material.dart';
import 'package:foot_fire/core/theming/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final void Function()? onPressed;
  final Color iconColor;
  const AppIconButton(
      {super.key,
      required this.size,
      required this.icon,
      this.onPressed,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkGrayColor.withOpacity(.5),
        borderRadius: BorderRadiusDirectional.circular(12),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: iconColor,
          size: size,
        ),
        onPressed: onPressed,
      ),
    );
  }
}