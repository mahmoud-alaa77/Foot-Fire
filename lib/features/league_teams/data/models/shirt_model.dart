

import 'package:json_annotation/json_annotation.dart';
part 'shirt_model.g.dart';
@JsonSerializable()
class ShirtModel {
  @JsonKey(name: "equipment")
  List<Shirt>? shirts;

  ShirtModel({this.shirts});



factory ShirtModel.fromJson(Map<String, dynamic> json) =>
      _$ShirtModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShirtModelToJson(this);


}
@JsonSerializable()
class Shirt {
  @JsonKey(name: "idEquipment")
  String? shirtID;
  @JsonKey(name: "idTeam")
  String? idTeam;
  String? date;
  String? strSeason;
  @JsonKey(name: "strEquipment")
  String? shirtImage;
  @JsonKey(name: "strType")
  String? shirtType;

  Shirt(
      {
      this.idTeam,
      this.date,
      this.strSeason,
      this.shirtID,
      this.shirtImage,
      this.shirtType,
     
      });

factory Shirt.fromJson(Map<String, dynamic> json) =>
      _$ShirtFromJson(json);

  Map<String, dynamic> toJson() => _$ShirtToJson(this);

 
}