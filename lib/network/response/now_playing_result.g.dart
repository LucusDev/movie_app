// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowPlayingResult _$NowPlayingResultFromJson(Map<String, dynamic> json) =>
    NowPlayingResult(
      (json['results'] as List<dynamic>?)
              ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$NowPlayingResultToJson(NowPlayingResult instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
