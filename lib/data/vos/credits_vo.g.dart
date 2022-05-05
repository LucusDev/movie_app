// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditVOAdapter extends TypeAdapter<CreditsVO> {
  @override
  final int typeId = 1;

  @override
  CreditsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditsVO(
      crew: (fields[1] as List).cast<PeopleVO>(),
      cast: (fields[2] as List).cast<PeopleVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, CreditsVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.crew)
      ..writeByte(2)
      ..write(obj.cast);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
