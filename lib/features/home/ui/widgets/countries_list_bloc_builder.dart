import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/helpers/helper_functions.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/home/logic/cubit/country_cubit.dart';
import 'package:foot_fire/features/home/logic/cubit/league_cubit.dart';
import 'package:foot_fire/features/home/ui/widgets/countries_list_shimmer_loading.dart';
import 'package:foot_fire/features/home/ui/widgets/country_list_item.dart';

class CountriesListBlocBuilder extends StatelessWidget {
  const CountriesListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryState>(
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
    );
  }

  ListView setCountriesListLoadedSuccess(BuildContext context, state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
            context.read<CountryCubit>().changeButtonState(index);
          },
        );
      },
      itemCount: state.countries.allCountries.length,
    );
  }
}
