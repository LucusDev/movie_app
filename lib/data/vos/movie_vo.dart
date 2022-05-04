import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/production_countries_vo.dart';
part 'movie_vo.g.dart';

@JsonSerializable()
class MovieVO {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "original_title")
  String? originalTitle;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "popularity")
  double? popularity;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "release_date")
  String? releaseDate;
  @JsonKey(name: "production_companies", defaultValue: [])
  List<ProductionCountriesVO>? productionCountries;
  @JsonKey(name: "runtime")
  int? runtime;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;

  MovieVO({
    this.id,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.runtime,
    this.title,
    this.productionCountries,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);
  Map<String, dynamic> toJson() => _$MovieVOToJson(this);
}
