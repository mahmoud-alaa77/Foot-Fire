import 'package:json_annotation/json_annotation.dart';

part 'league_model.g.dart';

@JsonSerializable()
class LeagueModel {
  List<Countries>? countries;

  LeagueModel({this.countries});

 factory LeagueModel.fromJson(Map<String, dynamic> json) =>
      _$LeagueModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueModelToJson(this);

}


@JsonSerializable()
class Countries {
  String? idLeague;
  @JsonKey(name: "strLeague")
  String? leagueName;
  @JsonKey(name: "strLeagueAlternate")
  String? leagueAlternateName;
  @JsonKey(name: "strCurrentSeason")
  String? currentSeason;
  @JsonKey(name: "intFormedYear")
  String? firstYear;
  String? dateFirstEvent;
  @JsonKey(name: "strCountry")
  String? leagueCountry;
  String? strWebsite;
  String? strFacebook;
  String? strInstagram;
  String? strTwitter;
  String? strYoutube;
  @JsonKey(name: "strDescriptionEN")
  String? descriptionEN;
  @JsonKey(name: "strBanner")
  String? bannerImage;
  @JsonKey(name: "strBadge")
  String? badgeImage;
  @JsonKey(name: "strLogo")
  String? logoimage;
  @JsonKey(name: "strPoster")
  String? posterImage;
  @JsonKey(name: "strTrophy")
  String? cupImage;

  Countries({
    this.idLeague,
    this.badgeImage,
    this.logoimage,
    this.posterImage,
    this.cupImage,
    this.leagueName,
    this.leagueAlternateName,
    this.bannerImage,
    this.currentSeason,
    this.firstYear,
    this.descriptionEN,
    this.leagueCountry,
    this.strFacebook,
    this.strInstagram,
    this.strTwitter,
    this.strYoutube,
    this.strWebsite,
    this.dateFirstEvent,
  });


   factory Countries.fromJson(Map<String, dynamic> json) =>
      _$CountriesFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesToJson(this);
}
