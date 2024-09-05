import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/widgets/custom_shimmer_loading_container.dart';

class NewsListShimmerLoading extends StatelessWidget {
  const NewsListShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      separatorBuilder: (context, index) {
        return verticalSpace(16);
      },
      itemBuilder: (context, index) {
        return Column(
          children: [
            CustomShimmerContainer(width: double.infinity, height: 180.h),
            verticalSpace(8),
            CustomShimmerContainer(width: double.infinity, height: 25.h),
            verticalSpace(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomShimmerContainer(width: 120.w, height: 20.h),
                CustomShimmerContainer(width: 75.w, height: 20.h),
              ],
            ),
          ],
        );
      },
    );
  }
}
