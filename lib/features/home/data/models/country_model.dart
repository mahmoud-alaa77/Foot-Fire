
import 'package:json_annotation/json_annotation.dart';
part 'country_model.g.dart';
@JsonSerializable()
class CountryModel{

@JsonKey(name: "name_en")
final String countryName;
@JsonKey(name: "flag_url_32")
final String flagImageUrl;

  CountryModel({required this.countryName, required this.flagImageUrl});

factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CountryModelToJson(this);

}