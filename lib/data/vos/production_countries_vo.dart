import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistent/hive_constants.dart';
part 'production_countries_vo.g.dart';

@HiveType(
    typeId: kProductionCountriesVOTypeId,
    adapterName: kProductionCountriesVOAdapterName)
@JsonSerializable()
class ProductionCountriesVO {
  @HiveField(1)
  @JsonKey(name: "iso31661")
  String? iso31661;

  @HiveField(2)
  @JsonKey(name: "name")
  String? name;

  ProductionCountriesVO({this.iso31661, this.name});

  factory ProductionCountriesVO.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesVOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountriesVOToJson(this);
}
