// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieVOAdapter extends TypeAdapter<MovieVO> {
  @override
  final int typeId = 3;

  @override
  MovieVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieVO(
      id: fields[1] as int?,
      type: fields[13] as MovieType?,
      originalTitle: fields[3] as String?,
      overview: fields[4] as String?,
      popularity: fields[5] as double?,
      posterPath: fields[6] as String?,
      releaseDate: fields[7] as String?,
      runtime: fields[9] as int?,
      title: fields[2] as String?,
      productionCountries: (fields[8] as List?)?.cast<ProductionCountriesVO>(),
      voteAverage: fields[10] as double?,
      voteCount: fields[11] as int?,
      genres: (fields[12] as List).cast<GenreVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, MovieVO obj) {
    writer
      ..writeByte(13)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.originalTitle)
      ..writeByte(4)
      ..write(obj.overview)
      ..writeByte(5)
      ..write(obj.popularity)
      ..writeByte(6)
      ..write(obj.posterPath)
      ..writeByte(7)
      ..write(obj.releaseDate)
      ..writeByte(8)
      ..write(obj.productionCountries)
      ..writeByte(9)
      ..write(obj.runtime)
      ..writeByte(10)
      ..write(obj.voteAverage)
      ..writeByte(11)
      ..write(obj.voteCount)
      ..writeByte(12)
      ..write(obj.genres)
      ..writeByte(13)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVO _$MovieVOFromJson(Map<String, dynamic> json) => MovieVO(
      id: json['id'] as int?,
      type: $enumDecodeNullable(_$MovieTypeEnumMap, json['type']),
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      runtime: json['runtime'] as int?,
      title: json['title'] as String?,
      productionCountries: (json['production_companies'] as List<dynamic>?)
              ?.map((e) =>
                  ProductionCountriesVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => GenreVO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MovieVOToJson(MovieVO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'production_companies': instance.productionCountries,
      'runtime': instance.runtime,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'genres': instance.genres,
      'type': _$MovieTypeEnumMap[instance.type],
    };

const _$MovieTypeEnumMap = {
  MovieType.nowPlaying: 'nowPlaying',
  MovieType.popular: 'popular',
  MovieType.showcase: 'showcase',
};
