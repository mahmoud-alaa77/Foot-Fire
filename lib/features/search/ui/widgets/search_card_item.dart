import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/search/data/models/search_item.dart';

class SearchCardItem extends StatelessWidget {
  final SearchItem searchItem;
  final void Function()? onTap;

  const SearchCardItem({super.key, required this.searchItem, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsetsDirectional.all(8),
          margin: const EdgeInsetsDirectional.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.darkGrayColor,
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: CachedNetworkImage(
                  imageUrl: searchItem.imageUrl ?? MyImages.unKnownPersonImage,
                  fit: BoxFit.cover,
                  height: 65.h,
                  width: 65.w,
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      searchItem.title ?? "",
                      style: AppTextStyles.font16WhiteW500,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(4),
                    Text(
                      searchItem.subTitle ?? "",
                      style: AppTextStyles.font14GreyW400,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
