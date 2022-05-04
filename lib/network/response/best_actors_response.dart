import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/people_vo.dart';
part 'best_actors_response.g.dart';

@JsonSerializable()
class BestActorsResponse {
  @JsonKey(defaultValue: [], name: "results")
  final List<PeopleVO> results;

  BestActorsResponse(this.results);

  factory BestActorsResponse.fromJson(Map<String, dynamic> json) =>
      _$BestActorsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BestActorsResponseToJson(this);
}
