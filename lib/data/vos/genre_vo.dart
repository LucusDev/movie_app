import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistent/hive_constants.dart';
part 'genre_vo.g.dart';

@HiveType(typeId: kGenreVOTypeId, adapterName: kGenreVOAdapterName)
@JsonSerializable()
class GenreVO {
  @HiveField(1)
  @JsonKey(name: "id")
  int? id;

  @HiveField(2)
  @JsonKey(name: "name")
  String? name;

  GenreVO({this.id, this.name});

  factory GenreVO.fromJson(Map<String, dynamic> json) =>
      _$GenreVOFromJson(json);
  Map<String, dynamic> toJson() => _$GenreVOToJson(this);

  @override
  int get hashCode => id.hashCode + name.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;
}
