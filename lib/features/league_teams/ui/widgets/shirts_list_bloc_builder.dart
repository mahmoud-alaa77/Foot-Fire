import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/league_teams/logic/cubit/team_cubit.dart';
import 'package:foot_fire/features/league_teams/ui/widgets/shirt_shimer_loading.dart';

class ShirtsListBlocBuilder extends StatelessWidget {
  const ShirtsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: BlocBuilder<TeamCubit, TeamState>(
        builder: (context, state) {
          if (state is TeamShirtsLoaded) {
            return CarouselSlider.builder(
              itemCount: state.shirtsList.length,
              itemBuilder: (context, index, realIndex) {
                return setShirtsListLoaded(state, index);
              },
              options: CarouselOptions(
                aspectRatio: 10 / 9,
                viewportFraction: .7,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 700),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.4,
              ),
            );
          } else {
            return const ShirtShimerLoading();
          }
        },
      ),
    );
  }
}

Widget setShirtsListLoaded(state, index) {
  return Column(
    children: [
      Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: AppColors.backGroundBlackColor),
        child: ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(16),
          child: CachedNetworkImage(
            errorWidget: (context, url, error) {
              return Container(
                decoration:
                    const BoxDecoration(color: AppColors.lightGrayColor),
                child: const Center(
                  child: Text("No Image Found !"),
                ),
              );
            },
            imageUrl: state.shirtsList[index].shirtImage ?? MyImages.emptyImage,
            fit: BoxFit.fill,
          ),
        ),
      ),
      verticalSpace(8),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Season (${state.shirtsList[index].strSeason ?? ""})",
          ),
          horizontalSpace(8),
          Text(
            "${state.shirtsList[index].shirtType}",
            style: AppTextStyles.font14OrangeW400,
          ),
        ],
      ),
    ],
  );
}
