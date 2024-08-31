import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/extentions.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/routing/routes.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/home/logic/cubit/league_cubit.dart';
import 'package:foot_fire/features/home/ui/widgets/leagues_list_item.dart';

class CountryListItem extends StatelessWidget {
  final void Function()? onPressed;
  final String name;
  final String flagImageUrl;
  final bool isSelected;
  final IconData icon;
  const CountryListItem(
      {super.key,
      this.onPressed,
      required this.name,
      required this.flagImageUrl,
      required this.isSelected,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 4, vertical: 8),
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 8),
      width: double.infinity,
      height: isSelected == true ? null : 70.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.darkGrayColor,
          border: Border.all(width: .1)),
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: flagImageUrl,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
              horizontalSpace(8),
              SizedBox(
                width: 220.w,
                child: Text(
                  name,
                  style: AppTextStyles.font16WhiteW500,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    icon,
                    color: Colors.white,
                  ))
            ],
          ),
          isSelected
              ? BlocBuilder<LeagueCubit, LeagueState>(
                  builder: (context, state) {
                    if (state is LeaguesListLoaded) {
                      if (state.leaguesList.countries == null) {
                        return Center(
                          child: Text(
                            "No availble leagues",
                            style: AppTextStyles.font14OrangeW400,
                          ),
                        );
                      } else {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.leaguesList.countries?.length ?? 0,
                          separatorBuilder: (context, index) =>
                              verticalSpace(8),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.pushNamed(Routes.leagueMainScreen,
                                    arguments:
                                        state.leaguesList.countries?[index]);
                              },
                              child: LeaguesListItem(
                                leagueImageUrl: state.leaguesList
                                        .countries?[index].badgeImage
                                        .toString() ??
                                    MyImages.emptyImage,
                                title: state.leaguesList.countries?[index]
                                        .leagueName
                                        .toString() ??
                                    "------------",
                              ),
                            );
                          },
                        );
                      }
                    } else if (state is LeaguesListFailure) {
                      return Center(
                          child: Text(
                        "Failed to load leagues",
                        style: AppTextStyles.font14OrangeW400,
                      ));
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
