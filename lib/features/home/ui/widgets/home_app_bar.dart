import 'package:flutter/material.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Foot ",
            style: AppTextStyles.font18WhiteW700,
          ),
          Text(
            "Fire🔥⚽",
            style: AppTextStyles.font14OrangeW400.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
