import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foot_fire/core/errors/failure.dart';
import 'package:foot_fire/core/errors/server_failure.dart';
import 'package:foot_fire/core/networking/api_services.dart';
import 'package:foot_fire/features/player_profile/data/models/career_model.dart';
import 'package:foot_fire/features/player_profile/data/models/honour_model.dart';
import 'package:foot_fire/features/player_profile/data/models/player_model.dart';
import 'package:foot_fire/features/search/data/models/search_player_model.dart';

class PlayerRepo {
  final ApiServices _apiServices;

  PlayerRepo(this._apiServices);

  Future<Either<Failure, HonourModel>> getHonoursByPlayerID(
      String playerId) async {
    try {
      var response = await _apiServices.getPlayerHonoursByPlayerId(playerId);

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  Future<Either<Failure, CareerModel>> getPlayerCareerByPlayerID(
      String playerId) async {
    try {
      var response = await _apiServices.getPlayerCareerByPlayerId(playerId);

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  Future<Either<Failure, PlayerModel>> getPlayerDetailsByPlayerID(
      String playerID) async {
    try {
      var response = await _apiServices.getPlayerDetailsByPlayerId(playerID);

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
