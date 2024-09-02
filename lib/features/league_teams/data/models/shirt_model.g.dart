// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shirt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShirtModel _$ShirtModelFromJson(Map<String, dynamic> json) => ShirtModel(
      shirts: (json['equipment'] as List<dynamic>?)
          ?.map((e) => Shirt.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShirtModelToJson(ShirtModel instance) =>
    <String, dynamic>{
      'equipment': instance.shirts,
    };

Shirt _$ShirtFromJson(Map<String, dynamic> json) => Shirt(
      idTeam: json['idTeam'] as String?,
      date: json['date'] as String?,
      strSeason: json['strSeason'] as String?,
      shirtID: json['idEquipment'] as String?,
      shirtImage: json['strEquipment'] as String?,
      shirtType: json['strType'] as String?,
    );

Map<String, dynamic> _$ShirtToJson(Shirt instance) => <String, dynamic>{
      'idEquipment': instance.shirtID,
      'idTeam': instance.idTeam,
      'date': instance.date,
      'strSeason': instance.strSeason,
      'strEquipment': instance.shirtImage,
      'strType': instance.shirtType,
    };
