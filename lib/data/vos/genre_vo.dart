import 'package:json_annotation/json_annotation.dart';
part 'genre_vo.g.dart';

@JsonSerializable()
class GenreVO {
  @JsonKey()
  int? id;
  @JsonKey()
  String? name;

  GenreVO({this.id, this.name});

  factory GenreVO.fromJson(Map<String, dynamic> json) =>
      _$GenreVOFromJson(json);
  Map<String, dynamic> toJson() => _$GenreVOToJson(this);
}
