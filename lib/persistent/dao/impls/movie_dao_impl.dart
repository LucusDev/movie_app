import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/persistent/dao/movie_dao.dart';
import 'package:movie_app/persistent/movie_type_enum.dart';

class MovieDaoImpl extends MovieDao {
  @override
  void saveAllMovie(List<MovieVO> movies) {
    getBox().putAll(
      movies.asMap().map((key, value) => MapEntry(value.id, value)),
    );
  }

  @override
  MovieVO getMovie(int id) {
    return getBox().get(id, defaultValue: MovieVO())!;
  }

  @override
  void saveMovie(MovieVO movie) {
    getBox().put(movie.id, movie);
  }

  @override
  Stream<dynamic> getAllMovieEventStream() {
    return getBox().watch();
  }

  @override
  List<MovieVO> getNowPlayingMovie() {
    return getBox()
        .values
        .where((element) => element.type == MovieType.nowPlaying)
        .toList();
  }

  @override
  Stream<List<MovieVO>> getNowPlayingMovieStream() {
    return Stream.value(getNowPlayingMovie());
  }

  @override
  List<MovieVO> getPopularMovie() {
    return getBox()
        .values
        .where((element) => element.type == MovieType.popular)
        .toList();
  }

  @override
  Stream<List<MovieVO>> getPopularMovieStream() {
    return Stream.value(getPopularMovie());
  }

  @override
  List<MovieVO> getShowCaseMovie() {
    return getBox()
        .values
        .where((element) => element.type == MovieType.showcase)
        .toList();
  }

  @override
  Stream<List<MovieVO>> getShowCaseMovieStream() {
    return Stream.value(getShowCaseMovie());
  }

  @override
  Future<List<MovieVO>> getAllMovie() async {
    return getBox().values.toList();
  }
}
