import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShirtShimerLoading extends StatelessWidget {
  const ShirtShimerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 66, 65, 65).withOpacity(.6),
      highlightColor: Colors.grey.withOpacity(.8),
      child: Center(
        child: Container(
          margin:
              const EdgeInsetsDirectional.symmetric(horizontal: 4, vertical: 8),
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 12, vertical: 8),
          width: 180.w,
          // height: 120.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.darkGrayColor,
              border: Border.all(width: .1)),
        ),
      ),
    );
  }
}
