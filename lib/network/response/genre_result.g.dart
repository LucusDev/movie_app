// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreResult _$GenreResultFromJson(Map<String, dynamic> json) => GenreResult(
      (json['genres'] as List<dynamic>?)
              ?.map((e) => GenreVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GenreResultToJson(GenreResult instance) =>
    <String, dynamic>{
      'genres': instance.results,
    };
