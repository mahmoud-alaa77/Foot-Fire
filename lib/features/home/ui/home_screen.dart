import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/home/logic/cubit/country_cubit.dart';
import 'package:foot_fire/features/home/ui/widgets/country_list_item.dart';
import 'package:foot_fire/features/home/ui/widgets/short_video_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backGroundBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundBlackColor,
        elevation: 0.0,
        title: Text(
          "Foot Fire🔥⚽",
          style: AppTextStyles.font18WhiteW700,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ShortVideoContainer(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(16),
                  Text(
                    "countries 🗺️🚩",
                    style: AppTextStyles.font24WhiteW700,
                  ),
                  verticalSpace(8),
                  BlocBuilder<CountryCubit,CountryState>(
                    builder: (context, state) {
                      if (state is CountriesListLoaded) {
                      return  ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CountryListItem(
                              isSelected:false,
                              name: state.countries.allCountries[index].countryName,
                              flagImageUrl:
                                  state.countries.allCountries[index].flagImageUrl,
                              onPressed: () {
                              },
                            );
                          },
                          itemCount: state.countries.allCountries.length,
                        );
                      } else if (state is CountriesListError) {
                       return Center(child: Text("Error loading countries",style: AppTextStyles.font16WhiteW500,));
                      }else{
                        return CircularProgressIndicator(); // Show loading indicator while waiting for data to load.
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
