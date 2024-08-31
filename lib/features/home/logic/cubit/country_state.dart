part of 'country_cubit.dart';

sealed class CountryState {}

final class CountryInitial extends CountryState {}

final class CountriesListLoading extends CountryState {}

final class CountriesListLoaded extends CountryState {
  final CountryModel countries;
  final List<bool> buttonStates;
  CountriesListLoaded(this.buttonStates, {required this.countries});
}

final class CustomCountriesListLoaded extends CountryState {
  final List<Country> countries;
  final List<bool> buttonStates;
  CustomCountriesListLoaded(this.buttonStates, {required this.countries});
}

final class CountriesListError extends CountryState {
  final String error;

  CountriesListError({required this.error});
}
