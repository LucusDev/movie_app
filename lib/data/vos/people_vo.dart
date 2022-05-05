import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistent/hive_constants.dart';
part 'people_vo.g.dart';

@HiveType(typeId: kPeopleVOTypeId, adapterName: kPeopleVOAdapterName)
@JsonSerializable()
class PeopleVO {
  @HiveField(1)
  @JsonKey(name: "id")
  int? id;

  @HiveField(2)
  @JsonKey(name: "name")
  String? name;

  @HiveField(3)
  @JsonKey(name: "profile_path")
  String? profilePath;

  PeopleVO({
    this.id,
    this.name,
    this.profilePath,
  });

  factory PeopleVO.fromJson(Map<String, dynamic> json) =>
      _$PeopleVOFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleVOToJson(this);
}
