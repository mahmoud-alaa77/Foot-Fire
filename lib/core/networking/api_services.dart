import 'package:dio/dio.dart';
import 'package:foot_fire/core/networking/api_constants.dart';
import 'package:foot_fire/features/home/data/models/country_model.dart';
import 'package:foot_fire/features/home/data/models/league_model.dart';
import 'package:foot_fire/features/league_matches/data/models/match_model.dart';
import 'package:foot_fire/features/league_table/data/models/table_model.dart';
import 'package:foot_fire/features/league_teams/data/models/shirt_model.dart';
import 'package:foot_fire/features/league_teams/data/models/team_model.dart';
import 'package:foot_fire/features/news/data/repo/news_model.dart';
import 'package:foot_fire/features/player_profile/data/models/career_model.dart';
import 'package:foot_fire/features/player_profile/data/models/honour_model.dart';
import 'package:foot_fire/features/player_profile/data/models/player_model.dart';
import 'package:foot_fire/features/search/data/models/search_player_model.dart';
import 'package:foot_fire/features/search/data/models/staduim_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.footballApiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET(ApiConstants.allCountriesEP)
  Future<CountryModel> getAllCountries();

  @GET(ApiConstants.allLeaguesEP)
  Future<LeagueModel> getLeaguesByCountryName(
      @Path("countryName") String countryName);

  @GET(ApiConstants.leagueTableEP)
  Future<TableModel> getTableByLeagueIdAndSeason(
      @Path("leagueId") String leagueId, @Path("season") String season);

  @GET(ApiConstants.allMatchesEP)
  Future<MatchModel> getAllMatchesByLeagueIdAndSeason(
      @Path("leagueId") String leagueId, @Path("season") String season);

  @GET(ApiConstants.teamsInLeagueEP)
  Future<TeamModel> getTeamsInLeagueByLeagueName(
      @Path("leagueName") String leagueName);

  @GET(ApiConstants.searchByPlayerEP)
  Future<SearchPlayerModel> searchByPlayer(
      @Path("playerName") String playerName);

  @GET(ApiConstants.searchByFullNameTeamEP)
  Future<TeamModel> searchByTeamFullName(
      @Path("teamFullName") String teamFullName);

  @GET(ApiConstants.searchByShortNameTeamEP)
  Future<TeamModel> searchByTeamShortName(
      @Path("teamShortName") String teamShortName);

  @GET(ApiConstants.searchByStduimNameEP)
  Future<StaduimModel> searchByStduimName(
      @Path("staduimName") String staduimName);

  @GET(ApiConstants.getPlayerHonoursByPlayerIdEP)
  Future<HonourModel> getPlayerHonoursByPlayerId(
      @Path("playerID") String playerID);

  @GET(ApiConstants.getPlayerCareerByPlayerIdEP)
  Future<CareerModel> getPlayerCareerByPlayerId(
      @Path("playerID") String playerID);

  @GET(ApiConstants.getShirtsByTeamIdEP)
  Future<ShirtModel> getShirtsByTeamId(@Path("teamID") String teamID);

  @GET(ApiConstants.getPlayerDetailsByPlayerIdEP)
  Future<PlayerModel> getPlayerDetailsByPlayerId(
      @Path("playerID") String playerID);

  @GET(ApiConstants.newsApiBaseUrl)
  Future<NewsModel> getNews(
       @Query("q") String? keyWord);
}
