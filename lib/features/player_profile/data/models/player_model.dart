
import 'package:json_annotation/json_annotation.dart';
part 'player_model.g.dart';

@JsonSerializable()
class PlayerModel {
  @JsonKey(name: "players")
  List<Player>? playersList;

  PlayerModel({this.playersList});

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerModelToJson(this);
}

@JsonSerializable()
class Player {
  String? idPlayer;
  String? idTeam;
  @JsonKey(name: "strNationality")
  String? playerNationality;
  @JsonKey(name: "strPlayer")
  String? playerName;
  @JsonKey(name: "strTeam")
  String? teamName;
  @JsonKey(name: "strSport")
  String? sportName;
  String? dateBorn;
  @JsonKey(name: "strNumber")
  String? playerNumber;
  String? dateSigned;
  @JsonKey(name: "strSigning")
  String? contractValue;
  @JsonKey(name: "strWage")
  String? salary;
  @JsonKey(name: "strBirthLocation")
  String? birthLocation;
  String? strEthnicity;
  String? strStatus;
  String? strDescriptionEN;
  String? strGender;
  @JsonKey(name: "strSide")
  String? mainFoot;
  String? strPosition;
  String? strFacebook;
  String? strWebsite;
  String? strTwitter;
  String? strInstagram;
  String? strYoutube;
  String? strHeight;
  String? strWeight;
  String? strThumb;
  String? strCutout;
  String? strRender;
  String? strBanner;
  String? strFanart1;
  String? strFanart2;
  String? strFanart3;
  String? strFanart4;

  Player(
      {this.idPlayer,
      this.idTeam,
      this.playerNationality,
      this.playerName,
      this.teamName,
      this.sportName,
      this.dateBorn,
      this.playerNumber,
      this.dateSigned,
      this.contractValue,
      this.salary,
      this.birthLocation,
      this.strEthnicity,
      this.strStatus,
      this.strDescriptionEN,
      this.strGender,
      this.mainFoot,
      this.strPosition,
      this.strFacebook,
      this.strWebsite,
      this.strTwitter,
      this.strInstagram,
      this.strYoutube,
      this.strHeight,
      this.strWeight,
      this.strThumb,
      this.strCutout,
      this.strRender,
      this.strBanner,
      this.strFanart1,
      this.strFanart2,
      this.strFanart3,
      this.strFanart4});

  factory Player.fromJson(Map<String, dynamic> json) =>
      _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
