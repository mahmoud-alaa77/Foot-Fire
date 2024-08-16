import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/home/logic/cubit/country_cubit.dart';
import 'package:foot_fire/features/home/ui/widgets/countries_list_shimmer_loading.dart';
import 'package:foot_fire/features/home/ui/widgets/country_list_item.dart';

class CountriesListBlocBuilder extends StatefulWidget {
  const CountriesListBlocBuilder({super.key});

  @override
  State<CountriesListBlocBuilder> createState() =>
      _CountriesListBlocBuilderState();
}

class _CountriesListBlocBuilderState extends State<CountriesListBlocBuilder> {
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
          name: state.countries.allCountries[index].countryName,
          flagImageUrl: state.countries.allCountries[index].flagImageUrl,
          onPressed: () {
            setState(() {
              context.read<CountryCubit>().changeButtonState(index);
            });
          },
        );
      },
      itemCount: state.countries.allCountries.length,
    );
  }
}
