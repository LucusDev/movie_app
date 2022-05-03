import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
part 'genre_result.g.dart';

@JsonSerializable()
class GenreResult {
  @JsonKey(defaultValue: [], name: "genres")
  final List<GenreVO> results;

  GenreResult(this.results);

  factory GenreResult.fromJson(Map<String, dynamic> json) =>
      _$GenreResultFromJson(json);
  Map<String, dynamic> toJson() => _$GenreResultToJson(this);
}
