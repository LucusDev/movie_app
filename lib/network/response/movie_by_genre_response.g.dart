// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_by_genre_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieByGenreResponse _$MovieByGenreResponseFromJson(
        Map<String, dynamic> json) =>
    MovieByGenreResponse(
      (json['results'] as List<dynamic>?)
              ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MovieByGenreResponseToJson(
        MovieByGenreResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
