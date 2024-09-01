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
  final FavoriteItemModel favItem;
  const FavoriteListItem({super.key, required this.favItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (DismissDirection direction) {
          DataBaseHelper().deleteFromFavorites(favItem.title);
          context.read<FavoritesCubit>().getFavoritesAfterFilter();
        },
        background: Container(
          margin:
              const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 8),
          color: AppColors.backGroundBlackColor,
          child: Center(
            child: Icon(
              Icons.close,
              size: 65.r,
              color: Colors.red,
            ),
          ),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.darkGrayColor.withOpacity(.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(100),
                child: CachedNetworkImage(
                  imageUrl: favItem.imageUrl,
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
              verticalSpace(12),
              Flexible(
                child: Text(
                  favItem.title,
                  style: AppTextStyles.font18WhiteW700,
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                favItem.subTitle,
                style: AppTextStyles.font14OrangeW400,
              )
            ],
          ),
        ),
      ),
    );
  }
}
