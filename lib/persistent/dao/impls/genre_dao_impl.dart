import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/persistent/dao/genre_dao.dart';

class GenreDaoImpl extends GenreDao {
  @override
  List<GenreVO> getGenres() {
    return getBox().values.toList();
  }

  @override
  void saveAllGenres(List<GenreVO> genres) {
    getBox()
        .putAll(genres.asMap().map((key, value) => MapEntry(value.id, value)));
  }
}
