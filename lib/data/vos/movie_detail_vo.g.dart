// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailVO _$MovieDetailVOFromJson(Map<String, dynamic> json) =>
    MovieDetailVO(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      runtime: json['runtime'] as int?,
      title: json['title'] as String?,
      productionCountries: (json['production_companies'] as List<dynamic>?)
              ?.map((e) =>
                  ProductionCountriesVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => GenreVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      credits: json['credits'] == null
          ? const CreditsVO()
          : CreditsVO.fromJson(json['credits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDetailVOToJson(MovieDetailVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'production_companies': instance.productionCountries,
      'runtime': instance.runtime,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'genres': instance.genres,
      'credits': instance.credits,
    };
