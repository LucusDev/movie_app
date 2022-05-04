// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditsVO _$CreditsVOFromJson(Map<String, dynamic> json) => CreditsVO(
      crew: (json['crew'] as List<dynamic>?)
              ?.map((e) => PeopleVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cast: (json['cast'] as List<dynamic>?)
              ?.map((e) => PeopleVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CreditsVOToJson(CreditsVO instance) => <String, dynamic>{
      'crew': instance.crew,
      'cast': instance.cast,
    };
