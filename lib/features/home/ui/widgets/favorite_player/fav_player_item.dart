import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class FavPlayerItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final void Function()? onTap;
  const FavPlayerItem({super.key, required this.title, required this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 105.w,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(24),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 100.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
            verticalSpace(6),
            Text(
              title,
              style: AppTextStyles.font14GreyW400,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
