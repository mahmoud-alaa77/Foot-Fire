import 'package:dio/dio.dart';
import 'package:foot_fire/core/networking/api_constants.dart';
import 'package:foot_fire/features/home/data/models/country_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET(ApiConstants.allCountries)
  Future<CountryModel> getAllCountries();
}
