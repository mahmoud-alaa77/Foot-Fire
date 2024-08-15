part of 'country_cubit.dart';

sealed class CountryState {}

final class CountryInitial extends CountryState {}

final class CountriesListLoading extends CountryState {}

final class CountriesListLoaded extends CountryState {
  final List<CountryModel> countries;

  CountriesListLoaded({required this.countries});
}

final class CountriesListError extends CountryState {
  final String error;

  CountriesListError({required this.error});
}
