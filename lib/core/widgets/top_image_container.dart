import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foot_fire/core/helpers/database_helper.dart';
import 'package:foot_fire/core/helpers/extentions.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/widgets/app_icon_button.dart';
import 'package:foot_fire/features/favorites/data/models/favorite_item_mode.dart';
import 'package:foot_fire/features/favorites/logic/cubit/favorites_cubit.dart';

class TopImageContainer extends StatelessWidget {
  final String bannerUrl;
  final String logoUrl;
  final void Function()? favOnPressed;
  final FavoriteItemModel favoriteItem;

  const TopImageContainer({
    super.key,
    required this.bannerUrl,
    required this.logoUrl,
    this.favOnPressed,
    required this.favoriteItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: Stack(
        children: [
          _buildBannerImage(),
          _buildLogo(),
          _buildBackButton(context),
          _buildFavoriteButton(context),
        ],
      ),
    );
  }

  Widget _buildBannerImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: CachedNetworkImage(
        imageUrl: bannerUrl,
        errorWidget: (context, url, error) => _buildErrorWidget(),
        width: double.infinity,
        height: 230.h,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: AppColors.lightGrayColor.withOpacity(.3),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 35,
          ),
          Text("No Image Found"),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Positioned(
      bottom: 0,
      left: 16.w,
      child: CircleAvatar(
        radius: 62.r,
        backgroundColor: AppColors.lightGrayColor,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.darkGrayColor,
          ),
          width: 118.w,
          height: 118.h,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: logoUrl,
                width: 115,
                height: 115,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 10.h,
      left: 10.w,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkGrayColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30.r,
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteButton(BuildContext context) {
    return Positioned(
      top: 10.h,
      right: 10.w,
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is IsFavoriteState) {
            return AppIconButton(
              icon: Icons.favorite_rounded,
              iconColor: state.isFavorite ? Colors.red : Colors.white,
              size: 40.w,
              onPressed: () => _toggleFavorite(state, context),
            );
          } else {
            return AppIconButton(
              icon: Icons.favorite,
              iconColor: Colors.transparent,
              size: 40.w,
              onPressed: () {},
            );
          }
        },
      ),
    );
  }

  void _toggleFavorite(IsFavoriteState state, BuildContext context) async {
    final db = DataBaseHelper();
    if (state.isFavorite) {
      await db.deleteFromFavorites(favoriteItem.title.toString());
    } else {
      await db.addItemToFavorites(favoriteItem);
    }
    // ignore: use_build_context_synchronously
    BlocProvider.of<FavoritesCubit>(context)
        .checkIsFavoriteOrNot(favoriteItem.title.toString());
  }
}
