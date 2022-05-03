import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
part 'movie_by_genre_result.g.dart';

@JsonSerializable()
class MovieByGenreResult {
  @JsonKey(defaultValue: [])
  final List<MovieVO> results;

  MovieByGenreResult(this.results);

  factory MovieByGenreResult.fromJson(Map<String, dynamic> json) =>
      _$MovieByGenreResultFromJson(json);
  Map<String, dynamic> toJson() => _$MovieByGenreResultToJson(this);
}
