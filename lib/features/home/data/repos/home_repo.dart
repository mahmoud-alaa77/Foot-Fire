import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foot_fire/core/errors/failure.dart';
import 'package:foot_fire/core/errors/server_failure.dart';
import 'package:foot_fire/core/networking/api_services.dart';
import 'package:foot_fire/features/home/data/models/country_model.dart';
import 'package:foot_fire/features/home/data/models/league_model.dart';

class HomeRepo {
  final ApiServices _apiServices;

  HomeRepo(this._apiServices);

  Future<Either<Failure, CountryModel>> getAllCountries() async {
    try {
      var response = await _apiServices.getAllCountries();

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  Future<Either<Failure, LeagueModel>> getAllLeaguesByCountryName(
      String countryName) async {
    try {
      var response = await _apiServices.getLeaguesByCountryName(countryName);

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }
}
