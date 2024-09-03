import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/extentions.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/routing/routes.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:foot_fire/features/home/ui/widgets/favorite_player/fav_player_item.dart';

class FavoritePlayersListBlocBuilder extends StatelessWidget {
  const FavoritePlayersListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesPlayersLoaded) {
          if (state.items.isEmpty) {
            return const SizedBox.shrink();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                horizontalSpace(12),
                Text(
                  "  Favorite players",
                  style: AppTextStyles.font18WhiteW400,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 150.h,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: state.items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FavPlayerItem(
                              onTap: () {
                              
                                context.pushNamed(Routes.playerDetailsScreen,arguments: state.items[index].id);
                              },
                              title: state.items[index].title,
                              imageUrl: state.items[index].imageUrl));
                    },
                  ),
                ),
              ],
            );
          }
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
