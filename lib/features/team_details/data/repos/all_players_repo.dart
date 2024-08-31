import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foot_fire/core/errors/failure.dart';
import 'package:foot_fire/core/errors/server_failure.dart';
import 'package:foot_fire/core/networking/api_services.dart';
import 'package:foot_fire/features/search/data/models/player_model.dart';

class AllPlayersRepo {
  final ApiServices _apiServices;

  AllPlayersRepo({required ApiServices apiServices})
      : _apiServices = apiServices;
  Future<Either<Failure, PlayerModel>> getAllPlayersInTeam(
      String teamID) async {
    try {
      var response = await _apiServices.getAllPlayersInTeamByIdEP(
        teamID,
      );

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
