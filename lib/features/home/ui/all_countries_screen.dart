import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/helpers/helper_functions.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/home/logic/cubit/country_cubit.dart';
import 'package:foot_fire/features/home/logic/cubit/league_cubit.dart';
import 'package:foot_fire/features/home/ui/widgets/countries_list_shimmer_loading.dart';
import 'package:foot_fire/features/home/ui/widgets/country_list_item.dart';

class AllCountriesScreen extends StatelessWidget {
  const AllCountriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Countries 🗺️🚩"),
        backgroundColor: AppColors.backGroundBlackColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.backGroundBlackColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
            child: BlocBuilder<CountryCubit, CountryState>(
              builder: (context, state) {
                if (state is CountriesListLoaded) {
                  return setCountriesListLoadedSuccess(context, state);
                } else if (state is CountriesListError) {
                  return Center(
                      child: Text(
                    state.error,
                    style: AppTextStyles.font16WhiteW500,
                  ));
                } else {
                  return const CountriesListShimmerLoading();
                }
              },
            )),
      ),
    );
  }

  ListView setCountriesListLoadedSuccess(
      BuildContext context, CountriesListLoaded state) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CountryListItem(
          isSelected: context.read<CountryCubit>().buttonStates[index],
          icon: context.read<CountryCubit>().buttonStates[index]
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
          name: state.countries.allCountries[index].countryName,
          flagImageUrl: state.countries.allCountries[index].flagImageUrl,
          onPressed: () async {
            if (context.read<CountryCubit>().buttonStates[index] == false) {
              await context.read<LeagueCubit>().getAllLeaguesByCountryName(
                  HelperFunctions().replaceSpaces(
                      state.countries.allCountries[index].countryName));
            }
            // ignore: use_build_context_synchronously
            context
                .read<CountryCubit>()
                .changeButtonStateForAllCountriesList(index);
          },
        );
      },
      itemCount: state.countries.allCountries.length,
    );
  }
}
