

import 'package:json_annotation/json_annotation.dart';
part 'career_model.g.dart';
@JsonSerializable()
class CareerModel {
  List<Formerteam>? formerteams;

  CareerModel({this.formerteams});


    factory CareerModel.fromJson(Map<String, dynamic> json) =>
      _$CareerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CareerModelToJson(this);
}


@JsonSerializable()
class Formerteam {
  String? id;
  String? strPlayer;
  String? strFormerTeam;
  String? strMoveType;
  String? strBadge;
  String? strJoined;
  String? strDeparted;

  Formerteam(
      {this.id,
      this.strPlayer,
      this.strFormerTeam,
      this.strMoveType,
      this.strBadge,
      this.strJoined,
      this.strDeparted});

      factory Formerteam.fromJson(Map<String, dynamic> json) =>
      _$FormerteamFromJson(json);

  Map<String, dynamic> toJson() => _$FormerteamToJson(this);
}
