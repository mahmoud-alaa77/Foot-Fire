import 'package:foot_fire/features/home/data/models/country_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/features/home/data/repos/home_repo.dart';
part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final HomeRepo _homeRepo;

  CountryCubit(this._homeRepo) : super(CountryInitial());

  getAllCountries() async {
    emit(CountriesListLoading());
    var result = await _homeRepo.getAllCountries();

    result.fold((failure) {
      emit(CountriesListError(error: failure.errorMessage));
    }, (countriesList) {
      emit(CountriesListLoaded(countries: countriesList));
    });
  }
}
