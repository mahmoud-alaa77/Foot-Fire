import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foot_fire/core/errors/failure.dart';
import 'package:foot_fire/core/errors/server_failure.dart';
import 'package:foot_fire/core/networking/api_services.dart';
import 'package:foot_fire/features/league_teams/data/models/team_model.dart';
import 'package:foot_fire/features/search/data/models/player_model.dart';
import 'package:foot_fire/features/search/data/models/staduim_model.dart';

class SearchRepo {
  final ApiServices _apiServices;
  SearchRepo(this._apiServices);

  Future<Either<Failure, PlayerModel>> searchByPlayer(String playerName) async {
    try {
      var response = await _apiServices.searchByPlayer(playerName);

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  Future<Either<Failure, TeamModel>> searchByTeamFullName(
      String teamName) async {
    try {
      var response = await _apiServices.searchByTeamFullName(teamName);

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  Future<Either<Failure, TeamModel>> searchByTeamShortName(
      String teamName) async {
    try {
      var response = await _apiServices.searchByTeamShortName(teamName);

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  Future<Either<Failure, StaduimModel>> searchByStaduimName(
      String staduimName) async {
    try {
      var response = await _apiServices.searchByStduimName(staduimName);

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
