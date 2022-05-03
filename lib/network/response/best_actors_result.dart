import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/people_vo.dart';
part 'best_actors_result.g.dart';

@JsonSerializable()
class BestActorsResult {
  @JsonKey(defaultValue: [])
  final List<PeopleVO> results;

  BestActorsResult(this.results);

  factory BestActorsResult.fromJson(Map<String, dynamic> json) =>
      _$BestActorsResultFromJson(json);
  Map<String, dynamic> toJson() => _$BestActorsResultToJson(this);
}
