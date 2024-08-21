// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamModel _$TeamModelFromJson(Map<String, dynamic> json) => TeamModel(
      teams: (json['teams'] as List<dynamic>?)
          ?.map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeamModelToJson(TeamModel instance) => <String, dynamic>{
      'teams': instance.teams,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      idTeam: json['idTeam'] as String?,
      teamName: json['strTeam'] as String?,
      teamAlternateName: json['strTeamAlternate'] as String?,
      shortName: json['strTeamShort'] as String?,
      leagueName: json['strLeague'] as String?,
      idLeague: json['idLeague'] as String?,
      idVenue: json['idVenue'] as String?,
      stadiumName: json['strStadium'] as String?,
      otherNames: json['strKeywords'] as String?,
      lLocation: json['strLocation'] as String?,
      intStadiumCapacity: json['intStadiumCapacity'] as String?,
      strWebsite: json['strWebsite'] as String?,
      strFacebook: json['strFacebook'] as String?,
      strTwitter: json['strTwitter'] as String?,
      strInstagram: json['strInstagram'] as String?,
      strDescriptionEN: json['strDescriptionEN'] as String?,
      strDescriptionDE: json['strDescriptionDE'] as String?,
      strDescriptionFR: json['strDescriptionFR'] as String?,
      strColour1: json['strColour1'] as String?,
      strColour2: json['strColour2'] as String?,
      strColour3: json['strColour3'] as String?,
      strCountry: json['strCountry'] as String?,
      strBadge: json['strBadge'] as String?,
      strLogo: json['strLogo'] as String?,
      strBanner: json['strBanner'] as String?,
      strEquipment: json['strEquipment'] as String?,
      strYoutube: json['strYoutube'] as String?,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'idTeam': instance.idTeam,
      'strTeam': instance.teamName,
      'strTeamAlternate': instance.teamAlternateName,
      'strTeamShort': instance.shortName,
      'strLeague': instance.leagueName,
      'idLeague': instance.idLeague,
      'idVenue': instance.idVenue,
      'strStadium': instance.stadiumName,
      'strKeywords': instance.otherNames,
      'strLocation': instance.lLocation,
      'intStadiumCapacity': instance.intStadiumCapacity,
      'strWebsite': instance.strWebsite,
      'strFacebook': instance.strFacebook,
      'strTwitter': instance.strTwitter,
      'strInstagram': instance.strInstagram,
      'strDescriptionEN': instance.strDescriptionEN,
      'strDescriptionDE': instance.strDescriptionDE,
      'strDescriptionFR': instance.strDescriptionFR,
      'strColour1': instance.strColour1,
      'strColour2': instance.strColour2,
      'strColour3': instance.strColour3,
      'strCountry': instance.strCountry,
      'strBadge': instance.strBadge,
      'strLogo': instance.strLogo,
      'strBanner': instance.strBanner,
      'strEquipment': instance.strEquipment,
      'strYoutube': instance.strYoutube,
    };
