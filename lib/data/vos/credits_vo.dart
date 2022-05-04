import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/people_vo.dart';
part 'credits_vo.g.dart';

@JsonSerializable()
class CreditsVO {
  @JsonKey(name: "crew")
  final List<PeopleVO> crew;
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
