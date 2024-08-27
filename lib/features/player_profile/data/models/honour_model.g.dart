// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'honour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HonourModel _$HonourModelFromJson(Map<String, dynamic> json) => HonourModel(
      honours: (json['honours'] as List<dynamic>?)
          ?.map((e) => Honour.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HonourModelToJson(HonourModel instance) =>
    <String, dynamic>{
      'honours': instance.honours,
    };

Honour _$HonourFromJson(Map<String, dynamic> json) => Honour(
      strPlayer: json['strPlayer'] as String?,
      strTeam: json['strTeam'] as String?,
      strHonour: json['strHonour'] as String?,
      strSeason: json['strSeason'] as String?,
    );

Map<String, dynamic> _$HonourToJson(Honour instance) => <String, dynamic>{
      'strPlayer': instance.strPlayer,
      'strTeam': instance.strTeam,
      'strHonour': instance.strHonour,
      'strSeason': instance.strSeason,
    };
