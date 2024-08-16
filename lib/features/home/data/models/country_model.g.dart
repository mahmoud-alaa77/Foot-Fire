// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      allCountries: (json['countries'] as List<dynamic>)
          .map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'countries': instance.allCountries,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      countryName: json['name_en'] as String,
      flagImageUrl: json['flag_url_32'] as String,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name_en': instance.countryName,
      'flag_url_32': instance.flagImageUrl,
    };
