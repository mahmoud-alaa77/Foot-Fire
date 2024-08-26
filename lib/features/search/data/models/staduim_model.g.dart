// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staduim_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaduimModel _$StaduimModelFromJson(Map<String, dynamic> json) => StaduimModel(
      venues: (json['venues'] as List<dynamic>?)
          ?.map((e) => Staduim.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StaduimModelToJson(StaduimModel instance) =>
    <String, dynamic>{
      'venues': instance.venues,
    };

Staduim _$StaduimFromJson(Map<String, dynamic> json) => Staduim(
      idVenue: json['idVenue'] as String?,
      staduimName: json['strVenue'] as String?,
      strVenueAlternate: json['strVenueAlternate'] as String?,
      strSport: json['strSport'] as String?,
      strDescriptionEN: json['strDescriptionEN'] as String?,
      intCapacity: json['intCapacity'] as String?,
      strCost: json['strCost'] as String?,
      strCountry: json['strCountry'] as String?,
      strLocation: json['strLocation'] as String?,
      intFormedYear: json['intFormedYear'] as String?,
      strFanart1: json['strFanart1'] as String?,
      strFanart2: json['strFanart2'] as String?,
      strFanart3: json['strFanart3'] as String?,
      strFanart4: json['strFanart4'] as String?,
      strThumb: json['strThumb'] as String?,
      strLogo: json['strLogo'] as String?,
      strWebsite: json['strWebsite'] as String?,
      strFacebook: json['strFacebook'] as String?,
      strInstagram: json['strInstagram'] as String?,
      strTwitter: json['strTwitter'] as String?,
      strYoutube: json['strYoutube'] as String?,
    );

Map<String, dynamic> _$StaduimToJson(Staduim instance) => <String, dynamic>{
      'idVenue': instance.idVenue,
      'strVenue': instance.staduimName,
      'strVenueAlternate': instance.strVenueAlternate,
      'strSport': instance.strSport,
      'strDescriptionEN': instance.strDescriptionEN,
      'intCapacity': instance.intCapacity,
      'strCost': instance.strCost,
      'strCountry': instance.strCountry,
      'strLocation': instance.strLocation,
      'intFormedYear': instance.intFormedYear,
      'strFanart1': instance.strFanart1,
      'strFanart2': instance.strFanart2,
      'strFanart3': instance.strFanart3,
      'strFanart4': instance.strFanart4,
      'strThumb': instance.strThumb,
      'strLogo': instance.strLogo,
      'strWebsite': instance.strWebsite,
      'strFacebook': instance.strFacebook,
      'strInstagram': instance.strInstagram,
      'strTwitter': instance.strTwitter,
      'strYoutube': instance.strYoutube,
    };
