import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
part 'movie_by_genre_response.g.dart';

@JsonSerializable()
class MovieByGenreResponse {
  @JsonKey(defaultValue: [], name: "results")
  final List<MovieVO> results;

  MovieByGenreResponse(this.results);

  factory MovieByGenreResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieByGenreResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieByGenreResponseToJson(this);
}
