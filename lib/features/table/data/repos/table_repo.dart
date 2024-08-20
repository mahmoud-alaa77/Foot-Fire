import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foot_fire/core/errors/failure.dart';
import 'package:foot_fire/core/errors/server_failure.dart';
import 'package:foot_fire/core/networking/api_services.dart';
import 'package:foot_fire/features/table/data/models/table_model.dart';

class TableRepo {
  final ApiServices _apiServices;

  TableRepo(this._apiServices);

 Future<Either<Failure, TableModel>> getTable(
      String leagueId,String season) async {
    try {
      var response = await _apiServices.getTableByLeagueIdAndSeason(leagueId, season);

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
