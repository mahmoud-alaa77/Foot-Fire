import 'package:foot_fire/features/home/data/models/country_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/features/home/data/repos/home_repo.dart';
part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final HomeRepo _homeRepo;
  CountryCubit(this._homeRepo) : super(CountryInitial());

  List<bool> buttonStates = [];
  late CountryModel allCountries;
  late List<Country> specialCountries;
  getAllCountries() async {
    emit(CountriesListLoading());

    var result = await _homeRepo.getAllCountries();

    result.fold((failure) {
      emit(CountriesListError(error: failure.errorMessage));
    }, (countriesList) {
      allCountries = countriesList;
      buttonStates =
          List.generate(countriesList.allCountries.length, (_) => false);
      emit(CountriesListLoaded(countries: countriesList, buttonStates));
    });
  }

  void changeButtonStateForAllCountriesList(int index) {
    if (buttonStates[index] == false) {
      buttonStates[index] = true;
      closeOtherTabs(index);

      emit(CountriesListLoaded(countries: allCountries, buttonStates));
    } else {
      buttonStates[index] = false;
      emit(CountriesListLoaded(countries: allCountries, buttonStates));
    }
  }

  void changeButtonStateForCustomCountriesList(int index) {
    if (buttonStates[index] == false) {
      buttonStates[index] = true;
      closeOtherTabs(index);

      emit(
          CustomCountriesListLoaded(countries: specialCountries, buttonStates));
    } else {
      buttonStates[index] = false;
      emit(
          CustomCountriesListLoaded(countries: specialCountries, buttonStates));
    }
  }

  void closeOtherTabs(int index) {
    for (int i = 0; i < buttonStates.length; i++) {
      if (buttonStates[i] == true && i != index) {
        buttonStates[i] = false;
      }
    }
  }

  getCustomCountries() async {
    emit(CountriesListLoading());

    var result = await _homeRepo.getAllCountries();

    result.fold((failure) {
      emit(CountriesListError(error: failure.errorMessage));
    }, (countriesList) {
      allCountries = countriesList;

      specialCountries = countriesList.allCountries
          .where((country) => customCountries.contains(country.countryName))
          .toList();
      buttonStates = List.generate(specialCountries.length, (_) => false);
      emit(
          CustomCountriesListLoaded(countries: specialCountries, buttonStates));
    });
  }

  List<String> customCountries = [
    'England',
    'Spain',
    'France',
    'Italy',
    'Germany',
    'Belgium',
    'Egypt',
    'Portugal',
    'The Netherlands',
    'Palestine',
    'Saudi Arabia',
    'turkiye',
    'Brazil',
    'Argentina'
  ];
}
