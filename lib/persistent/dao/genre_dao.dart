import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/persistent/dao.dart';
import 'package:movie_app/persistent/hive_constants.dart';

abstract class GenreDao extends Dao<GenreVO> {
  const GenreDao() : super(kGenreVOBoxName);

  void saveAllGenres(List<GenreVO> genres);

  Future<List<GenreVO>> getGenres();
}
