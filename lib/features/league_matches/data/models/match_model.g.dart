// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'events': instance.events,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      idEvent: json['idEvent'] as String?,
      eventFullName: json['strEvent'] as String?,
      idLeague: json['idLeague'] as String?,
      leagueName: json['strLeague'] as String?,
      strLeagueBadge: json['strLeagueBadge'] as String?,
      strSeason: json['strSeason'] as String?,
      strHomeTeam: json['strHomeTeam'] as String?,
      strAwayTeam: json['strAwayTeam'] as String?,
      intRound: json['intRound'] as String?,
      dateEvent: json['dateEvent'] as String?,
      dateEventLocal: json['dateEventLocal'] as String?,
      homeTeamScore: json['intHomeScore'] as String?,
      awayTeamScore: json['intAwayScore'] as String?,
      strTimeLocal: json['strTimeLocal'] as String?,
      idHomeTeam: json['idHomeTeam'] as String?,
      strHomeTeamBadge: json['strHomeTeamBadge'] as String?,
      idAwayTeam: json['idAwayTeam'] as String?,
      strAwayTeamBadge: json['strAwayTeamBadge'] as String?,
      idVenue: json['idVenue'] as String?,
      strVenue: json['strVenue'] as String?,
      strCountry: json['strCountry'] as String?,
      strPoster: json['strPoster'] as String?,
      strSquare: json['strSquare'] as String?,
      strThumb: json['strThumb'] as String?,
      strBanner: json['strBanner'] as String?,
      strVideo: json['strVideo'] as String?,
      strStatus: json['strStatus'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'idEvent': instance.idEvent,
      'strEvent': instance.eventFullName,
      'idLeague': instance.idLeague,
      'strLeague': instance.leagueName,
      'strLeagueBadge': instance.strLeagueBadge,
      'strSeason': instance.strSeason,
      'intHomeScore': instance.homeTeamScore,
      'intAwayScore': instance.awayTeamScore,
      'strHomeTeam': instance.strHomeTeam,
      'strAwayTeam': instance.strAwayTeam,
      'intRound': instance.intRound,
      'dateEvent': instance.dateEvent,
      'dateEventLocal': instance.dateEventLocal,
      'strTimeLocal': instance.strTimeLocal,
      'idHomeTeam': instance.idHomeTeam,
      'strHomeTeamBadge': instance.strHomeTeamBadge,
      'idAwayTeam': instance.idAwayTeam,
      'strAwayTeamBadge': instance.strAwayTeamBadge,
      'idVenue': instance.idVenue,
      'strVenue': instance.strVenue,
      'strCountry': instance.strCountry,
      'strPoster': instance.strPoster,
      'strSquare': instance.strSquare,
      'strThumb': instance.strThumb,
      'strBanner': instance.strBanner,
      'strVideo': instance.strVideo,
      'strStatus': instance.strStatus,
    };
