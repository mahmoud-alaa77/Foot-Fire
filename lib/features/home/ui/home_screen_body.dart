import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/extentions.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/routing/routes.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/home/ui/widgets/countries/countries_list_bloc_builder.dart';
import 'package:foot_fire/features/home/ui/widgets/favorite_player/favorite_players_list_bloc_builder.dart';
import 'package:foot_fire/features/home/ui/widgets/home_app_bar.dart';
import 'package:foot_fire/features/home/ui/widgets/short_video_container.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeAppBar(),
          const ShortVideoContainer(),
          verticalSpace(12),
          const FavoritePlayersListBlocBuilder(),
          Row(
            children: [
              horizontalSpace(12),
              Text(
                "Popular Countries 🗺️🚩",
                style: AppTextStyles.font18WhiteW400,
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    context.pushNamed(
                      Routes.allCountriesScreen,
                    );
                  },
                  child: Text(
                    "See all",
                    style: AppTextStyles.font14OrangeW400
                        .copyWith(decoration: TextDecoration.underline),
                  )),
              horizontalSpace(8)
            ],
          ),
          verticalSpace(8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: CountriesListBlocBuilder(),
          ),
        ],
      ),
    );
  }
}
