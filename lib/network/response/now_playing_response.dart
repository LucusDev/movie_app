import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
part 'now_playing_response.g.dart';

@JsonSerializable()
class NowPlayingResponse {
  @JsonKey(defaultValue: [], name: "results")
  final List<MovieVO> results;

  NowPlayingResponse(this.results);

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NowPlayingResponseToJson(this);
}
