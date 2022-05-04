import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
part 'show_case_response.g.dart';

@JsonSerializable()
class ShowCaseResponse {
  @JsonKey(defaultValue: [], name: "results")
  final List<MovieVO> results;

  ShowCaseResponse(this.results);

  factory ShowCaseResponse.fromJson(Map<String, dynamic> json) =>
      _$ShowCaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShowCaseResponseToJson(this);
}
