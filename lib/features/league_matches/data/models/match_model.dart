import 'package:json_annotation/json_annotation.dart';
part 'match_model.g.dart';

@JsonSerializable()
class MatchModel {
  List<Event>? events;

  MatchModel({this.events});

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);

  Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}

@JsonSerializable()
class Event {
  String? idEvent;
  @JsonKey(name: "strEvent")
  String? eventFullName;
  String? idLeague;
  @JsonKey(name: "strLeague")
  String? leagueName;
  String? strLeagueBadge;
  String? strSeason;
  @JsonKey(name: "intHomeScore")
  String? homeTeamScore;
  @JsonKey(name: "intAwayScore")
  String? awayTeamScore;
  String? strHomeTeam;
  String? strAwayTeam;
  String? intRound;
  String? dateEvent;
  String? dateEventLocal;
  String? strTimeLocal;
  String? idHomeTeam;
  String? strHomeTeamBadge;
  String? idAwayTeam;
  String? strAwayTeamBadge;
  String? idVenue;
  String? strVenue;
  String? strCountry;
  String? strPoster;
  String? strSquare;
  String? strThumb;
  String? strBanner;
  String? strVideo;
  String? strStatus;

  Event({
    this.idEvent,
    this.eventFullName,
    this.idLeague,
    this.leagueName,
    this.strLeagueBadge,
    this.strSeason,
    this.strHomeTeam,
    this.strAwayTeam,
    this.intRound,
    this.dateEvent,
    this.dateEventLocal,
    this.homeTeamScore,
    this.awayTeamScore,
    this.strTimeLocal,
    this.idHomeTeam,
    this.strHomeTeamBadge,
    this.idAwayTeam,
    this.strAwayTeamBadge,
    this.idVenue,
    this.strVenue,
    this.strCountry,
    this.strPoster,
    this.strSquare,
    this.strThumb,
    this.strBanner,
    this.strVideo,
    this.strStatus,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
