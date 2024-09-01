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
  State<FavoritesListFilter> createState() => _FavoritesListFilterState();
}

class _FavoritesListFilterState extends State<FavoritesListFilter> {
  void _updateFilter({required bool all, required bool team, required bool player}) {
    final cubit = context.read<FavoritesCubit>();
    setState(() {
      cubit.filterAllItemsButton = all;
      cubit.filterTeamButton = team;
      cubit.filterPlayerButton = player;
    });

    if (all) {
      cubit.getAllFavoriteItems();
    } else if (team) {
      cubit.getFavoriteTeams();
    } else if (player) {
      cubit.getFavoritePlayers();
    }

    
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content:  Center(child:  Text("⬅Pull horizontally to delete➡",style: AppTextStyles.font12WhiteW300,)),
          backgroundColor: AppColors.lightGrayColor.withOpacity(.1),
        ),
      );
    
  }

  Widget _buildFilterButton(String title, bool isActive, VoidCallback onTap) {
    return FilterItemButton(
      title: title,
      borderColor: isActive ? Colors.white : AppColors.backGroundBlackColor,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoritesCubit>();

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
                _buildFilterButton(
                  "All",
                  cubit.filterAllItemsButton,
                  () => _updateFilter(all: true, team: false, player: false),
                ),
                horizontalSpace(6),
                _buildFilterButton(
                  "Teams",
                  cubit.filterTeamButton,
                  () => _updateFilter(all: false, team: true, player: false),
                ),
                horizontalSpace(6),
                _buildFilterButton(
                  "Players",
                  cubit.filterPlayerButton,
                  () => _updateFilter(all: false, team: false, player: true),
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
