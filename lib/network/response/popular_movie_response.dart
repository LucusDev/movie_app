import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
part 'popular_movie_response.g.dart';

@JsonSerializable()
class PopularMovieResponse {
  @JsonKey(defaultValue: [], name: "results")
  final List<MovieVO> results;

  PopularMovieResponse(this.results);

  factory PopularMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PopularMovieResponseToJson(this);
}
