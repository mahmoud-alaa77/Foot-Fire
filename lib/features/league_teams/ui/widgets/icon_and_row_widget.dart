import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class IconAndRowWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const IconAndRowWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(
          icon,
        ),
        horizontalSpace(8),
        Flexible(
          child: Text(
           title,
            style: AppTextStyles.font14GreyW400,
          ),
        ),
      ],
    );
  }
}
