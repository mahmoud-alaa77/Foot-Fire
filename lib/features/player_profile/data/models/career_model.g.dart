// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareerModel _$CareerModelFromJson(Map<String, dynamic> json) => CareerModel(
      formerteams: (json['formerteams'] as List<dynamic>?)
          ?.map((e) => Formerteam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CareerModelToJson(CareerModel instance) =>
    <String, dynamic>{
      'formerteams': instance.formerteams,
    };

Formerteam _$FormerteamFromJson(Map<String, dynamic> json) => Formerteam(
      id: json['id'] as String?,
      strPlayer: json['strPlayer'] as String?,
      strFormerTeam: json['strFormerTeam'] as String?,
      strMoveType: json['strMoveType'] as String?,
      strBadge: json['strBadge'] as String?,
      strJoined: json['strJoined'] as String?,
      strDeparted: json['strDeparted'] as String?,
    );

Map<String, dynamic> _$FormerteamToJson(Formerteam instance) =>
    <String, dynamic>{
      'id': instance.id,
      'strPlayer': instance.strPlayer,
      'strFormerTeam': instance.strFormerTeam,
      'strMoveType': instance.strMoveType,
      'strBadge': instance.strBadge,
      'strJoined': instance.strJoined,
      'strDeparted': instance.strDeparted,
    };
