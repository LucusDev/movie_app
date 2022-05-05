// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_countries_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductionCountriedVOAdapter extends TypeAdapter<ProductionCountriesVO> {
  @override
  final int typeId = 5;

  @override
  ProductionCountriesVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCountriesVO(
      iso31661: fields[1] as String?,
      name: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCountriesVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.iso31661)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCountriedVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCountriesVO _$ProductionCountriesVOFromJson(
        Map<String, dynamic> json) =>
    ProductionCountriesVO(
      iso31661: json['iso31661'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductionCountriesVOToJson(
        ProductionCountriesVO instance) =>
    <String, dynamic>{
      'iso31661': instance.iso31661,
      'name': instance.name,
    };
