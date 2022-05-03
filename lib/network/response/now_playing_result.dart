import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
part 'now_playing_result.g.dart';

@JsonSerializable()
class NowPlayingResult {
  @JsonKey(defaultValue: [])
  final List<MovieVO> results;

  NowPlayingResult(this.results);

  factory NowPlayingResult.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingResultFromJson(json);
  Map<String, dynamic> toJson() => _$NowPlayingResultToJson(this);
}
