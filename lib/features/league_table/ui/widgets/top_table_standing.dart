import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class TopTableStanding extends StatelessWidget {
  const TopTableStanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.lightGrayColor.withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 45.h,
      child: Row(
        children: [
          Expanded(
              child: Text(
            "  #",
            style: AppTextStyles.font14OrangeW400.copyWith(fontSize: 28),
          )),
          Expanded(
            child: Row(
              children: [
                const Text('PL'),
                horizontalSpace(16),
                Container(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
                  color: Colors.green,
                  child: const Text('W'),
                ),
                Container(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                  color: Colors.blue,
                  child: const Text('D'),
                ),
                Container(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                  color: Colors.red,
                  child: const Text('L'),
                ),
                horizontalSpace(16),
                // const Text('+/-'),
                const Text('GD'),
                horizontalSpace(16),
                const Text('Pts'),
              ],
            ),
          )
        ],
      ),
    );
  }
}