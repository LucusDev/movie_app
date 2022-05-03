// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movie_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovieResult _$PopularMovieResultFromJson(Map<String, dynamic> json) =>
    PopularMovieResult(
      (json['results'] as List<dynamic>?)
              ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PopularMovieResultToJson(PopularMovieResult instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
