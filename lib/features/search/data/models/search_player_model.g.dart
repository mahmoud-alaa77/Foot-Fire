// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPlayerModel _$SearchPlayerModelFromJson(Map<String, dynamic> json) =>
    SearchPlayerModel(
      playersList: (json['player'] as List<dynamic>?)
          ?.map((e) => SearchPlayer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchPlayerModelToJson(SearchPlayerModel instance) =>
    <String, dynamic>{
      'player': instance.playersList,
    };

SearchPlayer _$SearchPlayerFromJson(Map<String, dynamic> json) => SearchPlayer(
      idPlayer: json['idPlayer'] as String?,
      idTeam: json['idTeam'] as String?,
      playerNationality: json['strNationality'] as String?,
      playerName: json['strPlayer'] as String?,
      teamName: json['strTeam'] as String?,
      sportName: json['strSport'] as String?,
      dateBorn: json['dateBorn'] as String?,
      playerNumber: json['strNumber'] as String?,
      dateSigned: json['dateSigned'] as String?,
      contractValue: json['strSigning'] as String?,
      salary: json['strWage'] as String?,
      birthLocation: json['strBirthLocation'] as String?,
      strEthnicity: json['strEthnicity'] as String?,
      strStatus: json['strStatus'] as String?,
      strDescriptionEN: json['strDescriptionEN'] as String?,
      strGender: json['strGender'] as String?,
      mainFoot: json['strSide'] as String?,
      strPosition: json['strPosition'] as String?,
      strFacebook: json['strFacebook'] as String?,
      strWebsite: json['strWebsite'] as String?,
      strTwitter: json['strTwitter'] as String?,
      strInstagram: json['strInstagram'] as String?,
      strYoutube: json['strYoutube'] as String?,
      strHeight: json['strHeight'] as String?,
      strWeight: json['strWeight'] as String?,
      strThumb: json['strThumb'] as String?,
      strCutout: json['strCutout'] as String?,
      strRender: json['strRender'] as String?,
      strBanner: json['strBanner'] as String?,
      strFanart1: json['strFanart1'] as String?,
      strFanart2: json['strFanart2'] as String?,
      strFanart3: json['strFanart3'] as String?,
      strFanart4: json['strFanart4'] as String?,
    );

Map<String, dynamic> _$SearchPlayerToJson(SearchPlayer instance) =>
    <String, dynamic>{
      'idPlayer': instance.idPlayer,
      'idTeam': instance.idTeam,
      'strNationality': instance.playerNationality,
      'strPlayer': instance.playerName,
      'strTeam': instance.teamName,
      'strSport': instance.sportName,
      'dateBorn': instance.dateBorn,
      'strNumber': instance.playerNumber,
      'dateSigned': instance.dateSigned,
      'strSigning': instance.contractValue,
      'strWage': instance.salary,
      'strBirthLocation': instance.birthLocation,
      'strEthnicity': instance.strEthnicity,
      'strStatus': instance.strStatus,
      'strDescriptionEN': instance.strDescriptionEN,
      'strGender': instance.strGender,
      'strSide': instance.mainFoot,
      'strPosition': instance.strPosition,
      'strFacebook': instance.strFacebook,
      'strWebsite': instance.strWebsite,
      'strTwitter': instance.strTwitter,
      'strInstagram': instance.strInstagram,
      'strYoutube': instance.strYoutube,
      'strHeight': instance.strHeight,
      'strWeight': instance.strWeight,
      'strThumb': instance.strThumb,
      'strCutout': instance.strCutout,
      'strRender': instance.strRender,
      'strBanner': instance.strBanner,
      'strFanart1': instance.strFanart1,
      'strFanart2': instance.strFanart2,
      'strFanart3': instance.strFanart3,
      'strFanart4': instance.strFanart4,
    };
