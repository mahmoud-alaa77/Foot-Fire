import 'package:json_annotation/json_annotation.dart';
part 'team_model.g.dart';
@JsonSerializable()
class TeamModel {
  List<Team>? teams;

  TeamModel({this.teams});




factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamModelToJson(this);
}

@JsonSerializable()
class Team {
  String? idTeam;

  @JsonKey(name: "strTeam")
  String? teamName;
  @JsonKey(name: "strTeamAlternate")
  String? teamAlternateName;
  @JsonKey(name: "strTeamShort")
  String? shortName;
  @JsonKey(name: "strLeague")
  String? leagueName;
  String? idLeague;

  String? idVenue;
  @JsonKey(name: "strStadium")
  String? stadiumName;
  @JsonKey(name: "strKeywords")
  String? otherNames;
  @JsonKey(name: "strLocation")
  String? lLocation;

  String? intStadiumCapacity;

  String? strWebsite;
  String? strFacebook;
  String? strTwitter;
  String? strInstagram;
  String? strDescriptionEN;
  String? strDescriptionDE;
  String? strDescriptionFR;

  String? strColour1;
  String? strColour2;
  String? strColour3;

  String? strCountry;
  String? strBadge;
  String? strLogo;

  String? strBanner;
  String? strEquipment;
  String? strYoutube;

  Team({
    this.idTeam,
    this.teamName,
    this.teamAlternateName,
    this.shortName,
    this.leagueName,
    this.idLeague,
    this.idVenue,
    this.stadiumName,
    this.otherNames,
    this.lLocation,
    this.intStadiumCapacity,
    this.strWebsite,
    this.strFacebook,
    this.strTwitter,
    this.strInstagram,
    this.strDescriptionEN,
    this.strDescriptionDE,
    this.strDescriptionFR,
    this.strColour1,
    this.strColour2,
    this.strColour3,
    this.strCountry,
    this.strBadge,
    this.strLogo,
    this.strBanner,
    this.strEquipment,
    this.strYoutube,

  });


factory Team.fromJson(Map<String, dynamic> json) =>
      _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);

}
