import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/credits_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_detail_vo.dart';
import 'package:movie_app/data/vos/production_countries_vo.dart';
import 'package:movie_app/persistent/movie_type_enum.dart';
part 'movie_detail_response.g.dart';

@JsonSerializable()
class MovieDetailResponse extends MovieDetailVO {
  MovieDetailResponse({
    int? id,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    int? runtime,
    String? title,
    List<ProductionCountriesVO>? productionCountries,
    double? voteAverage,
    int? voteCount,
    CreditsVO credits = const CreditsVO(),
    List<GenreVO> genres = const [],
    MovieType? type,
  }) : super(
          type: type,
          genres: genres,
          credits: credits,
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

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);
}
