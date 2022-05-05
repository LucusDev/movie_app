// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_type_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieTypeEnumAdapter extends TypeAdapter<MovieType> {
  @override
  final int typeId = 6;

  @override
  MovieType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MovieType.nowPlaying;
      case 1:
        return MovieType.popular;
      case 2:
        return MovieType.showcase;
      default:
        return MovieType.nowPlaying;
    }
  }

  @override
  void write(BinaryWriter writer, MovieType obj) {
    switch (obj) {
      case MovieType.nowPlaying:
        writer.writeByte(0);
        break;
      case MovieType.popular:
        writer.writeByte(1);
        break;
      case MovieType.showcase:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieTypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
