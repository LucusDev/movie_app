// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovieResponse _$PopularMovieResponseFromJson(
        Map<String, dynamic> json) =>
    PopularMovieResponse(
      (json['results'] as List<dynamic>?)
              ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PopularMovieResponseToJson(
        PopularMovieResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
