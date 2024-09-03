import 'package:flutter/material.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerContainer extends StatelessWidget {
  final double width;
  final double height;
  const CustomShimmerContainer(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 66, 65, 65).withOpacity(.6),
      highlightColor: Colors.grey.withOpacity(.8),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.darkGrayColor,
            border: Border.all(width: .1)),
      ),
    );
  }
}
