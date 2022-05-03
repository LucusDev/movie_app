// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_by_genre_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieByGenreResult _$MovieByGenreResultFromJson(Map<String, dynamic> json) =>
    MovieByGenreResult(
      (json['results'] as List<dynamic>?)
              ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MovieByGenreResultToJson(MovieByGenreResult instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
