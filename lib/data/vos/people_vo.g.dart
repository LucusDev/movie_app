// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PeopleVOAdapter extends TypeAdapter<PeopleVO> {
  @override
  final int typeId = 4;

  @override
  PeopleVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PeopleVO(
      id: fields[1] as int?,
      name: fields[2] as String?,
      profilePath: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PeopleVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeopleVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
