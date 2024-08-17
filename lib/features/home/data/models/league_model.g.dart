// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeagueModel _$LeagueModelFromJson(Map<String, dynamic> json) => LeagueModel(
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Countries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeagueModelToJson(LeagueModel instance) =>
    <String, dynamic>{
      'countries': instance.countries,
    };

Countries _$CountriesFromJson(Map<String, dynamic> json) => Countries(
      idLeague: json['idLeague'] as String?,
      badgeImage: json['strBadge'] as String?,
      logoimage: json['strLogo'] as String?,
      posterImage: json['strPoster'] as String?,
      cupImage: json['strTrophy'] as String?,
      leagueName: json['strLeague'] as String?,
      leagueAlternateName: json['strLeagueAlternate'] as String?,
      bannerImage: json['strBanner'] as String?,
      currentSeason: json['strCurrentSeason'] as String?,
      firstYear: json['intFormedYear'] as String?,
      descriptionEN: json['strDescriptionEN'] as String?,
      leagueCountry: json['strCountry'] as String?,
      strFacebook: json['strFacebook'] as String?,
      strInstagram: json['strInstagram'] as String?,
      strTwitter: json['strTwitter'] as String?,
      strYoutube: json['strYoutube'] as String?,
      strWebsite: json['strWebsite'] as String?,
      dateFirstEvent: json['dateFirstEvent'] as String?,
    );

Map<String, dynamic> _$CountriesToJson(Countries instance) => <String, dynamic>{
      'idLeague': instance.idLeague,
      'strLeague': instance.leagueName,
      'strLeagueAlternate': instance.leagueAlternateName,
      'strCurrentSeason': instance.currentSeason,
      'intFormedYear': instance.firstYear,
      'dateFirstEvent': instance.dateFirstEvent,
      'strCountry': instance.leagueCountry,
      'strWebsite': instance.strWebsite,
      'strFacebook': instance.strFacebook,
      'strInstagram': instance.strInstagram,
      'strTwitter': instance.strTwitter,
      'strYoutube': instance.strYoutube,
      'strDescriptionEN': instance.descriptionEN,
      'strBanner': instance.bannerImage,
      'strBadge': instance.badgeImage,
      'strLogo': instance.logoimage,
      'strPoster': instance.posterImage,
      'strTrophy': instance.cupImage,
    };
