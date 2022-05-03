import 'package:json_annotation/json_annotation.dart';
part 'production_countries_vo.g.dart';

@JsonSerializable()
class ProductionCountriesVO {
  @JsonKey()
  String? iso31661;
  @JsonKey()
  String? name;

  ProductionCountriesVO({this.iso31661, this.name});

  factory ProductionCountriesVO.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesVOFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountriesVOToJson(this);
}
