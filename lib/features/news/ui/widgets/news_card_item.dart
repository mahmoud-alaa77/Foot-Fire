import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class NewsCardItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String source;
  final String date;
  final void Function()? onTap;
  const NewsCardItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.source,
      required this.date,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.backGroundBlackColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  // placeholder: (context, url) => const Center(
                  //     child: CircularProgressIndicator(
                  //   color: AppColors.orangeColor,
                  // )),
                  errorWidget: (context, url, error) =>
                      const Center(child: Text("No Image Found")),
                  fit: BoxFit.fill,
                )),
            verticalSpace(8),
            Text(
              title,
              style: AppTextStyles.font16WhiteW500,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  "By: $source",
                  style: AppTextStyles.font14GreyW400,
                  maxLines: 1,
                )),
                Text(
                  date,
                  style: AppTextStyles.font14GreyW400,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
