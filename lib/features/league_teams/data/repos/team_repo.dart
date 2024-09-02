import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foot_fire/core/errors/server_failure.dart';
import 'package:foot_fire/core/networking/api_services.dart';
import 'package:foot_fire/features/league_teams/data/models/shirt_model.dart';
import 'package:foot_fire/features/league_teams/data/models/team_model.dart';

import '../../../../core/errors/failure.dart';

class TeamRepo {
  final ApiServices _apiServices;

  TeamRepo(this._apiServices);

  Future<Either<Failure, TeamModel>> getTeams(String leagueName) async {
    try {
      var response =
          await _apiServices.getTeamsInLeagueByLeagueName(leagueName);

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  Future<Either<Failure, ShirtModel>> getShirtByTeamID(String teamID) async {
    try {
      var response = await _apiServices.getShirtsByTeamId(teamID);

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
