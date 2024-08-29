import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:foot_fire/core/widgets/filter_item_button.dart';

class FavoritesListFilter extends StatefulWidget {
  const FavoritesListFilter({super.key});

  @override
  State<FavoritesListFilter> createState() => _FilterListState();
}

class _FilterListState extends State<FavoritesListFilter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 35.h,
      child: Row(
        children: [
           Text(
            "Filter by :",
            style: AppTextStyles.font14OrangeW400,
          ),
          horizontalSpace(6),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterItemButton(
                  title: "All",
                  borderColor:
                      context.read<FavoritesCubit>().filterAllItemsButton == true
                          ? Colors.white
                          : AppColors.backGroundBlackColor,
                  onTap: () {
                    setState(() {
                      context.read<FavoritesCubit>().filterAllItemsButton = true;
                      context.read<FavoritesCubit>().filterPlayerButton = false;
                      context.read<FavoritesCubit>().filterTeamButton = false;
                    });
                                  context.read<FavoritesCubit>().getAllFavoriteItems();
            
                  },
                ),
                horizontalSpace(6),
                FilterItemButton(
                  borderColor: context.read<FavoritesCubit>().filterTeamButton == true
                      ? Colors.white
                      : AppColors.backGroundBlackColor,
                  title: "Teams",
                  onTap: () {
                    setState(() {
                      context.read<FavoritesCubit>().filterAllItemsButton = false;
                      context.read<FavoritesCubit>().filterPlayerButton = false;
                      context.read<FavoritesCubit>().filterTeamButton = true;
                    });
                                  context.read<FavoritesCubit>().getFavoriteTeams();
            
                  },
                ),
                horizontalSpace(6),
                FilterItemButton(
                  borderColor:
                      context.read<FavoritesCubit>().filterPlayerButton == true
                          ? Colors.white
                          : AppColors.backGroundBlackColor,
                  title: "Players",
                  onTap: () {
                    setState(() {
                      context.read<FavoritesCubit>().filterAllItemsButton = false;
                      context.read<FavoritesCubit>().filterPlayerButton = true;
                      context.read<FavoritesCubit>().filterTeamButton = false;
                    });
                    context.read<FavoritesCubit>().getFavoritePlayers();
                  },
                ),
                horizontalSpace(6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
