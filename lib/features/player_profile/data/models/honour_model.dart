import 'package:json_annotation/json_annotation.dart';
part 'honour_model.g.dart';

@JsonSerializable()
class HonourModel {
  List<Honour>? honours;

  HonourModel({this.honours});
  factory HonourModel.fromJson(Map<String, dynamic> json) =>
      _$HonourModelFromJson(json);

  Map<String, dynamic> toJson() => _$HonourModelToJson(this);
}

@JsonSerializable()
class Honour {
  String? strPlayer;
  String? strTeam;
  String? strHonour;
  String? strSeason;

  Honour({this.strPlayer, this.strTeam, this.strHonour, this.strSeason});

  factory Honour.fromJson(Map<String, dynamic> json) => _$HonourFromJson(json);

  Map<String, dynamic> toJson() => _$HonourToJson(this);
}
