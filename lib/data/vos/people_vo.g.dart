// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeopleVO _$PeopleVOFromJson(Map<String, dynamic> json) => PeopleVO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$PeopleVOToJson(PeopleVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
    };
