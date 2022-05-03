import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
part 'show_case_result.g.dart';

@JsonSerializable()
class ShowCaseResult {
  @JsonKey(defaultValue: [])
  final List<MovieVO> results;

  ShowCaseResult(this.results);

  factory ShowCaseResult.fromJson(Map<String, dynamic> json) =>
      _$ShowCaseResultFromJson(json);
  Map<String, dynamic> toJson() => _$ShowCaseResultToJson(this);
}
