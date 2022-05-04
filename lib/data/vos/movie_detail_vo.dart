import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/credits_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/data/vos/production_countries_vo.dart';
part 'movie_detail_vo.g.dart';

@JsonSerializable()
class MovieDetailVO extends MovieVO {
  @JsonKey(name: "credits")
  final CreditsVO credits;

  MovieDetailVO({
    int? id,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    int? runtime,
    String? title,
    List<ProductionCountriesVO>? productionCountries,
    List<GenreVO> genres = const [],
    double? voteAverage,
    int? voteCount,
    this.credits = const CreditsVO(),
  }) : super(
          genres: genres,
          id: id,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          productionCountries: productionCountries,
          releaseDate: releaseDate,
          runtime: runtime,
          title: title,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieDetailVO.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailVOFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MovieDetailVOToJson(this);
}
