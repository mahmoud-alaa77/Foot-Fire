// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableModel _$TableModelFromJson(Map<String, dynamic> json) => TableModel(
      table: (json['table'] as List<dynamic>?)
          ?.map((e) => Table.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TableModelToJson(TableModel instance) =>
    <String, dynamic>{
      'table': instance.table,
    };

Table _$TableFromJson(Map<String, dynamic> json) => Table(
      idStanding: json['idStanding'] as String?,
      idTeam: json['idTeam'] as String?,
      idLeague: json['idLeague'] as String?,
      teamName: json['strTeam'] as String?,
      badge: json['strBadge'] as String?,
      leagueName: json['strLeague'] as String?,
      season: json['strSeason'] as String?,
      description: json['strDescription'] as String?,
      intPlayed: json['intPlayed'] as String?,
      intWin: json['intWin'] as String?,
      intLoss: json['intLoss'] as String?,
      intDraw: json['intDraw'] as String?,
      intGoalsFor: json['intGoalsFor'] as String?,
      intGoalsAgainst: json['intGoalsAgainst'] as String?,
      intGoalDifference: json['intGoalDifference'] as String?,
      intPoints: json['intPoints'] as String?,
      dateUpdated: json['dateUpdated'] as String?,
    )..rank = json['intRank'] as String?;

Map<String, dynamic> _$TableToJson(Table instance) => <String, dynamic>{
      'idStanding': instance.idStanding,
      'intRank': instance.rank,
      'idTeam': instance.idTeam,
      'strTeam': instance.teamName,
      'strBadge': instance.badge,
      'idLeague': instance.idLeague,
      'strLeague': instance.leagueName,
      'strSeason': instance.season,
      'strDescription': instance.description,
      'intPlayed': instance.intPlayed,
      'intWin': instance.intWin,
      'intLoss': instance.intLoss,
      'intDraw': instance.intDraw,
      'intGoalsFor': instance.intGoalsFor,
      'intGoalsAgainst': instance.intGoalsAgainst,
      'intGoalDifference': instance.intGoalDifference,
      'intPoints': instance.intPoints,
      'dateUpdated': instance.dateUpdated,
    };
