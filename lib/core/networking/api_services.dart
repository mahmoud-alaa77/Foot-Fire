import 'package:dio/dio.dart';
import 'package:foot_fire/core/networking/api_constants.dart';
import 'package:foot_fire/features/home/data/models/country_model.dart';
import 'package:foot_fire/features/home/data/models/league_model.dart';
import 'package:foot_fire/features/league_matches/data/models/match_model.dart';
import 'package:foot_fire/features/league_table/data/models/table_model.dart';
import 'package:foot_fire/features/league_teams/data/models/team_model.dart';
import 'package:foot_fire/features/player_profile/data/models/honour_model.dart';
import 'package:foot_fire/features/search/data/models/player_model.dart';
import 'package:foot_fire/features/search/data/models/staduim_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET(ApiConstants.allCountries)
  Future<CountryModel> getAllCountries();

  @GET("/api/v1/json/3/search_all_leagues.php?c={countryName}")
  Future<LeagueModel> getLeaguesByCountryName(
      @Path("countryName") String countryName);

  @GET("/api/v1/json/3/lookuptable.php?l={leagueId}&s={season}")
  Future<TableModel> getTableByLeagueIdAndSeason(
      @Path("leagueId") String leagueId, @Path("season") String season);

  @GET("/api/v1/json/3/eventsseason.php?id={leagueId}&s={season}")
  Future<MatchModel> getAllMatchesByLeagueIdAndSeason(
      @Path("leagueId") String leagueId, @Path("season") String season);

  @GET("/api/v1/json/3/search_all_teams.php?l={leagueName}")
  Future<TeamModel> getTeamsInLeagueByLeagueName(
      @Path("leagueName") String leagueName);

  @GET("/api/v1/json/3/searchplayers.php?p={playerName}")
  Future<PlayerModel> searchByPlayer(@Path("playerName") String playerName);

  @GET("/api/v1/json/3/searchteams.php?t={teamFullName}")
  Future<TeamModel> searchByTeamFullName(
      @Path("teamFullName") String teamFullName);

  @GET("/api/v1/json/3/searchteams.php?sname={teamShortName}")
  Future<TeamModel> searchByTeamShortName(
      @Path("teamShortName") String teamShortName);

  @GET("/api/v1/json/3/searchvenues.php?t={staduimName}")
  Future<StaduimModel> searchByStduimName(
      @Path("staduimName") String staduimName);

  @GET("/api/v1/json/3/lookuphonours.php?id={playerID}")
  Future<HonourModel> getPlayerHonoursByPlayerId(
      @Path("playerID") String playerID);
}
