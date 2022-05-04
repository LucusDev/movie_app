// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_case_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowCaseResponse _$ShowCaseResponseFromJson(Map<String, dynamic> json) =>
    ShowCaseResponse(
      (json['results'] as List<dynamic>?)
              ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ShowCaseResponseToJson(ShowCaseResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
