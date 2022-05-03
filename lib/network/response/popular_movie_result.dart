import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
part 'popular_movie_result.g.dart';

@JsonSerializable()
class PopularMovieResult {
  @JsonKey(defaultValue: [])
  final List<MovieVO> results;

  PopularMovieResult(this.results);

  factory PopularMovieResult.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResultFromJson(json);
  Map<String, dynamic> toJson() => _$PopularMovieResultToJson(this);
}
