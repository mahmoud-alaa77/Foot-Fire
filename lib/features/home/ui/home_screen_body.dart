import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/home/ui/widgets/countries_list_bloc_builder.dart';
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
          verticalSpace(16),
          Text(
            "  Countries 🗺️🚩",
            style: AppTextStyles.font20WhiteW800,
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
