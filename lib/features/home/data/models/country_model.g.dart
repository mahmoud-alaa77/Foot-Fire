// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      countryName: json['name_en'] as String,
      flagImageUrl: json['flag_url_32'] as String,
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'name_en': instance.countryName,
      'flag_url_32': instance.flagImageUrl,
    };
