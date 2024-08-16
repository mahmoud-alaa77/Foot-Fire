import 'package:json_annotation/json_annotation.dart';
part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  @JsonKey(name: "countries")
  final List<Country> allCountries;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  CountryModel({required this.allCountries});

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}

@JsonSerializable()
class Country {
  @JsonKey(name: "name_en")
  final String countryName;
  @JsonKey(name: "flag_url_32")
  final String flagImageUrl;
  Country({required this.countryName, required this.flagImageUrl});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
