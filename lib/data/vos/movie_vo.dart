import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/production_countries_vo.dart';
import 'package:movie_app/persistent/hive_constants.dart';
import 'package:movie_app/persistent/movie_type_enum.dart';
part 'movie_vo.g.dart';

@HiveType(typeId: kMovieVOTypeId, adapterName: kMovieVOAdapterName)
@JsonSerializable()
class MovieVO {
  @HiveField(1)
  @JsonKey(name: "id")
  int? id;

  @HiveField(2)
  @JsonKey(name: "title")
  String? title;

  @HiveField(3)
  @JsonKey(name: "original_title")
  String? originalTitle;

  @HiveField(4)
  @JsonKey(name: "overview")
  String? overview;

  @HiveField(5)
  @JsonKey(name: "popularity")
  double? popularity;

  @HiveField(6)
  @JsonKey(name: "poster_path")
  String? posterPath;

  @HiveField(7)
  @JsonKey(name: "release_date")
  String? releaseDate;

  @HiveField(8)
  @JsonKey(name: "production_companies", defaultValue: [])
  List<ProductionCountriesVO>? productionCountries;

  @HiveField(9)
  @JsonKey(name: "runtime")
  int? runtime;

  @HiveField(10)
  @JsonKey(name: "vote_average")
  double? voteAverage;

  @HiveField(11)
  @JsonKey(name: "vote_count")
  int? voteCount;

  @HiveField(12)
  @JsonKey(name: "genres")
  List<GenreVO> genres;

  @HiveField(13)
  MovieType? type;

  MovieVO({
    this.id,
    this.type,
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
    this.genres = const [],
  });

  @override
  int get hashCode =>
      id.hashCode +
      originalTitle.hashCode +
      overview.hashCode +
      popularity.hashCode +
      posterPath.hashCode +
      releaseDate.hashCode +
      runtime.hashCode +
      title.hashCode +
      productionCountries.hashCode +
      voteAverage.hashCode +
      voteCount.hashCode +
      genres.hashCode;

  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          type == other.type &&
          originalTitle == other.originalTitle &&
          overview == other.overview &&
          popularity == other.popularity &&
          posterPath == other.posterPath &&
          releaseDate == other.releaseDate &&
          runtime == other.runtime &&
          title == other.title &&
          listEquals(productionCountries, other.productionCountries) &&
          voteAverage == other.voteAverage &&
          voteCount == other.voteCount &&
          listEquals(genres, other.genres);
}
