import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/search/logic/cubit/search_cubit.dart';
import 'package:foot_fire/features/search/ui/widgets/filter_item_button.dart';

class FilterList extends StatefulWidget {
  const FilterList({super.key});

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 35.h,
      child: Row(
        children: [
          Text(
            "Search by :",
            style: AppTextStyles.font14OrangeW400,
          ),
          horizontalSpace(6),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterItemButton(
                  title: "Player",
                  borderColor:
                      context.read<SearchCubit>().searchPlayerButton == true
                          ? Colors.white
                          : AppColors.backGroundBlackColor,
                  onTap: () {
                    setState(() {
                      context.read<SearchCubit>().searchPlayerButton = true;
                      context.read<SearchCubit>().searchTeamFullNameButton =
                          false;
                      context.read<SearchCubit>().searchTeamShortNameButton =
                          false;
                      context.read<SearchCubit>().searchStaduimButton = false;
                    });
                  },
                ),
                horizontalSpace(6),
                FilterItemButton(
                  borderColor:
                      context.read<SearchCubit>().searchTeamFullNameButton ==
                              true
                          ? Colors.white
                          : AppColors.backGroundBlackColor,
                  title: "Team(full name)",
                  onTap: () {
                    setState(() {});
                    context.read<SearchCubit>().searchPlayerButton = false;
                    context.read<SearchCubit>().searchTeamFullNameButton = true;
                    context.read<SearchCubit>().searchTeamShortNameButton =
                        false;
                    context.read<SearchCubit>().searchStaduimButton = false;
                  },
                ),
                horizontalSpace(6),
                FilterItemButton(
                  borderColor:
                      context.read<SearchCubit>().searchTeamShortNameButton ==
                              true
                          ? Colors.white
                          : AppColors.backGroundBlackColor,
                  title: "Team(short name)",
                  onTap: () {
                    setState(() {});
                    context.read<SearchCubit>().searchPlayerButton = false;
                    context.read<SearchCubit>().searchTeamFullNameButton =
                        false;
                    context.read<SearchCubit>().searchTeamShortNameButton =
                        true;
                    context.read<SearchCubit>().searchStaduimButton = false;
                  },
                ),
                horizontalSpace(6),
                FilterItemButton(
                  borderColor:
                      context.read<SearchCubit>().searchStaduimButton == true
                          ? Colors.white
                          : AppColors.backGroundBlackColor,
                  title: "Staduim",
                  onTap: () {
                    setState(() {});
                    context.read<SearchCubit>().searchPlayerButton = false;
                    context.read<SearchCubit>().searchTeamFullNameButton =
                        false;
                    context.read<SearchCubit>().searchTeamShortNameButton =
                        false;
                    context.read<SearchCubit>().searchStaduimButton = true;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
