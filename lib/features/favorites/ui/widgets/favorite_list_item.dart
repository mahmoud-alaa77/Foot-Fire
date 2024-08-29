import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/database_helper.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/favorites/data/models/favorite_item_mode.dart';
import 'package:foot_fire/features/favorites/logic/cubit/favorites_cubit.dart';

class FavoriteListItem extends StatelessWidget {
  final FavoriteItemModel favoriteItemModel;

  const FavoriteListItem({super.key, required this.favoriteItemModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrayColor),
          borderRadius: BorderRadiusDirectional.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: favoriteItemModel.category == "team" ? 10 : 0,
                vertical: favoriteItemModel.category == "team" ? 12 : 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: favoriteItemModel.imageUrl,
                width: favoriteItemModel.category == "team" ? 50 : 70,
                height: favoriteItemModel.category == "team" ? 75 : 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(10),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(8),
                Text(
                  favoriteItemModel.title,
                  style: AppTextStyles.font20WhiteW800,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(4),
                Text(
                  favoriteItemModel.subTitle,
                  style: AppTextStyles.font16GreyW400,
                ),
                 Text(
                  favoriteItemModel.category,
                  style: AppTextStyles.font16GreyW400,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(
                Icons.highlight_remove_sharp,
                color: Colors.red.withOpacity(.7),
                size: 35.r,
              ),
              onPressed: () {
                DataBaseHelper().deleteFromFavorites(favoriteItemModel.title);
                context.read<FavoritesCubit>().getFavoritesAfterFilter();
              },
            ),
          ),
        ],
      ),
    );
  }
}
