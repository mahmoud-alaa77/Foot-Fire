import 'package:json_annotation/json_annotation.dart';


part 'table_model.g.dart';
@JsonSerializable()
class TableModel {
  List<Table>? table;

  TableModel({this.table});

 factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);

  Map<String, dynamic> toJson() => _$TableModelToJson(this);

}

@JsonSerializable()
class Table {
  String? idStanding;
  @JsonKey(name: "intRank")
  String? rank;
  String? idTeam;
  @JsonKey(name: "strTeam")
  String? teamName;
  @JsonKey(name: "strBadge")
  String? badge;
  String? idLeague;
  @JsonKey(name: "strLeague")
  String? leagueName;
  @JsonKey(name: "strSeason")
  String? season;
  @JsonKey(name: "strDescription")
  String? description;
  String? intPlayed;
  String? intWin;
  String? intLoss;
  String? intDraw;
  String? intGoalsFor;
  String? intGoalsAgainst;
  String? intGoalDifference;
  String? intPoints;
  String? dateUpdated;

  Table(
      {this.idStanding,
      this.idTeam,
      this.idLeague,
      this.teamName,
      this.badge,
      this.leagueName,
      this.season,
      this.description,
      this.intPlayed,
      this.intWin,
      this.intLoss,
      this.intDraw,
      this.intGoalsFor,
      this.intGoalsAgainst,
      this.intGoalDifference,
      this.intPoints,
      this.dateUpdated});


 factory Table.fromJson(Map<String, dynamic> json) =>
      _$TableFromJson(json);

  Map<String, dynamic> toJson() => _$TableToJson(this);


}
