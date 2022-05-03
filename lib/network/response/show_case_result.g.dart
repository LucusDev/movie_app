// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_case_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowCaseResult _$ShowCaseResultFromJson(Map<String, dynamic> json) =>
    ShowCaseResult(
      (json['results'] as List<dynamic>?)
              ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ShowCaseResultToJson(ShowCaseResult instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
