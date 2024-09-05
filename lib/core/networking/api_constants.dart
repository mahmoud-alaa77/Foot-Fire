class ApiConstants {
  static const String footballApiBaseUrl = 'https://www.thesportsdb.com';
  static const String allCountriesEP = "/api/v1/json/3/all_countries.php";
  static const String allLeaguesEP =
      "/api/v1/json/3/search_all_leagues.php?c={countryName}";
  static const String leagueTableEP =
      "/api/v1/json/3/lookuptable.php?l={leagueId}&s={season}";

  static const String allMatchesEP =
      "/api/v1/json/3/eventsseason.php?id={leagueId}&s={season}";

  static const String teamsInLeagueEP =
      "/api/v1/json/3/search_all_teams.php?l={leagueName}";

  static const String searchByPlayerEP =
      "/api/v1/json/3/searchplayers.php?p={playerName}";

  static const String searchByFullNameTeamEP =
      "/api/v1/json/3/searchteams.php?t={teamFullName}";
  static const String searchByShortNameTeamEP =
      "/api/v1/json/3/searchteams.php?sname={teamShortName}";
  static const String searchByStduimNameEP =
      "/api/v1/json/3/searchvenues.php?t={staduimName}";
  static const String getPlayerHonoursByPlayerIdEP =
      "/api/v1/json/3/lookuphonours.php?id={playerID}";
  static const String getPlayerCareerByPlayerIdEP =
      "/api/v1/json/3/lookupformerteams.php?id={playerID}";
  static const String getShirtsByTeamIdEP =
      "/api/v1/json/3/lookupequipment.php?id={teamID}";
  static const String getPlayerDetailsByPlayerIdEP =
      "/api/v1/json/3/lookupplayer.php?id={playerID}";

  // for news features
  static const String newsApiBaseUrl =
      'https://gnews.io/api/v4/top-headlines?category=sports&q=football&q=Soccer&apikey=$newsApiKey';
  static const String newsApiKey = 'e19eaf493bf0c85069c44110430c83bf';
}
