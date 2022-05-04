import 'package:json_annotation/json_annotation.dart';
part 'people_vo.g.dart';

@JsonSerializable()
class PeopleVO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

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
