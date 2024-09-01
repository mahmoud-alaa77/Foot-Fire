import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:foot_fire/features/favorites/ui/widgets/favorite_list_item.dart';
import 'package:foot_fire/features/favorites/ui/widgets/favorites_list_filter.dart';
import 'package:foot_fire/features/search/ui/widgets/no_result_found.dart';

class FavoriteItemsScreen extends StatelessWidget {
  const FavoriteItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          favoritesAppBar(),
          verticalSpace(16),
          const FavoritesListFilter(),
          verticalSpace(16),
          Expanded(
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (context, state) {
              if (state is AllFavoritesItemsLoaded) {
                if (state.items.isEmpty) {
                  return const NoResultFound();
                }
                {
                  return favoriteItemsFounded(state);
                }
              } else if (state is FavoritesPlayersLoaded) {
                if (state.items.isEmpty) {
                  return const NoResultFound();
                }
                {
                  return favoriteItemsFounded(state);
                }
              } else if (state is FavoritesTeamsLoaded) {
                if (state.items.isEmpty) {
                  return const NoResultFound();
                }
                {
                  return favoriteItemsFounded(state);
                }
              } else if (state is FavoritesError) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.orangeColor,
                ));
              }
            }),
          ),
        ],
      ),
    );
  }

  GridView favoriteItemsFounded(state) {
    return GridView.builder(
        padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: .9,
        ),
        itemCount: state.items.length,
        itemBuilder: (context, index) {
          return FavoriteListItem(favItem: state.items[index]);
        });
  }
}

Row favoritesAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("My Favorites", style: AppTextStyles.font18WhiteW400),
      horizontalSpace(4),
      const Icon(
        Icons.favorite,
        color: Color.fromARGB(255, 255, 255, 255),
        size: 30,
      ),
    ],
  );
}
