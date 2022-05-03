// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_actors_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestActorsResult _$BestActorsResultFromJson(Map<String, dynamic> json) =>
    BestActorsResult(
      (json['results'] as List<dynamic>?)
              ?.map((e) => PeopleVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BestActorsResultToJson(BestActorsResult instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
