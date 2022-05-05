import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/people_vo.dart';
import 'package:movie_app/persistent/hive_constants.dart';
part 'credits_vo.g.dart';

@HiveType(typeId: kCreditsVOTypeId, adapterName: kCreditsVOAdapterName)
@JsonSerializable()
class CreditsVO {
  @HiveField(1)
  @JsonKey(name: "crew")
  final List<PeopleVO> crew;

  @HiveField(2)
  @JsonKey(name: "cast")
  final List<PeopleVO> cast;

  const CreditsVO({
    this.crew = const [],
    this.cast = const [],
  });

  factory CreditsVO.fromJson(Map<String, dynamic> json) =>
      _$CreditsVOFromJson(json);
  Map<String, dynamic> toJson() => _$CreditsVOToJson(this);
}
