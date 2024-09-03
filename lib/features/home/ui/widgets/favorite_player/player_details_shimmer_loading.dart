import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/widgets/custom_shimmer_loading_container.dart';

class PlayerDetailsShimmerLoding extends StatelessWidget {
  const PlayerDetailsShimmerLoding({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomShimmerContainer(
              height: MediaQuery.of(context).size.height / 3.2,
              width: double.infinity,
            ),
            verticalSpace(12),
            CustomShimmerContainer(
              height: 24.h,
              width: 220.w,
            ),
            verticalSpace(12),
            CustomShimmerContainer(
              height: 22.h,
              width: 170.w,
            ),
            verticalSpace(12),
            CustomShimmerContainer(
              height: 220.h,
              width: double.infinity,
            ),
            verticalSpace(12),
            CustomShimmerContainer(
              height: 65.h,
              width: double.infinity,
            ),
            verticalSpace(12),
            CustomShimmerContainer(
              height: 65.h,
              width: double.infinity,
            ),
            verticalSpace(12),
            CustomShimmerContainer(
              height: 22.h,
              width: 170.w,
            ),
            verticalSpace(12),
            CustomShimmerContainer(
              height: 22.h,
              width: double.infinity,
            ),
            verticalSpace(4),
            CustomShimmerContainer(
              height: 22.h,
              width: double.infinity,
            ),
            verticalSpace(4),
            CustomShimmerContainer(
              height: 22.h,
              width: double.infinity,
            ),
            verticalSpace(4),
            CustomShimmerContainer(
              height: 22.h,
              width: double.infinity,
            ),
            verticalSpace(4),
            CustomShimmerContainer(
              height: 22.h,
              width: double.infinity,
            ),
            verticalSpace(4),
            CustomShimmerContainer(
              height: 22.h,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
