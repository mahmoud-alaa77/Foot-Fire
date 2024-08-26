import 'package:json_annotation/json_annotation.dart';

part 'staduim_model.g.dart';

@JsonSerializable()
class StaduimModel {
  List<Staduim>? venues;

  StaduimModel({this.venues});

factory StaduimModel.fromJson(Map<String, dynamic> json) =>
      _$StaduimModelFromJson(json);

  Map<String, dynamic> toJson() => _$StaduimModelToJson(this);


}

@JsonSerializable()
class Staduim {
  String? idVenue;
  @JsonKey(name: "strVenue")
  String? staduimName;
  String? strVenueAlternate;
  String? strSport;
  String? strDescriptionEN;
  String? intCapacity;
  String? strCost;
  String? strCountry;
  String? strLocation;
  String? intFormedYear;
  String? strFanart1;
  String? strFanart2;
  String? strFanart3;
  String? strFanart4;
  String? strThumb;
  String? strLogo;
  String? strWebsite;
  String? strFacebook;
  String? strInstagram;
  String? strTwitter;
  String? strYoutube;

  Staduim({
    required this.idVenue,
    required this.staduimName,
    required this.strVenueAlternate,
    required this.strSport,
    required this.strDescriptionEN,
    required this.intCapacity,
    required this.strCost,
    required this.strCountry,
    required this.strLocation,
    required this.intFormedYear,
    required this.strFanart1,
    required this.strFanart2,
    required this.strFanart3,
    required this.strFanart4,
    required this.strThumb,
    required this.strLogo,
    required this.strWebsite,
    required this.strFacebook,
    required this.strInstagram,
    required this.strTwitter,
    required this.strYoutube,
  });


  
factory Staduim.fromJson(Map<String, dynamic> json) =>
      _$StaduimFromJson(json);

  Map<String, dynamic> toJson() => _$StaduimToJson(this);
}
