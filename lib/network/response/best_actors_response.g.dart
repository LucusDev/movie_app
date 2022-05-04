// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_actors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestActorsResponse _$BestActorsResponseFromJson(Map<String, dynamic> json) =>
    BestActorsResponse(
      (json['results'] as List<dynamic>?)
              ?.map((e) => PeopleVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BestActorsResponseToJson(BestActorsResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
