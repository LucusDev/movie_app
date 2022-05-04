import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
part 'genre_response.g.dart';

@JsonSerializable()
class GenreResponse {
  @JsonKey(defaultValue: [], name: "genres")
  final List<GenreVO> genres;

  GenreResponse(this.genres);

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);
}
