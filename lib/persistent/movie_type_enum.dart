import 'package:hive/hive.dart';
import 'package:movie_app/persistent/hive_constants.dart';
part 'movie_type_enum.g.dart';

@HiveType(typeId: kMovieTypeEnumId, adapterName: kMovieTypeEnumAdapterName)
enum MovieType {
  @HiveField(0)
  nowPlaying,
  @HiveField(1)
  popular,
  @HiveField(2)
  showcase,
}
