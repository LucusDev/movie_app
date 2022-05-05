import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/persistent/dao.dart';
import 'package:movie_app/persistent/hive_constants.dart';

abstract class MovieDao extends Dao<MovieVO> {
  const MovieDao() : super(kMovieVOBoxName);
//CRUD
  void saveAllMovie(List<MovieVO> movies);

  Future<List<MovieVO>> getAllMovie();

  void saveMovie(MovieVO movie);

  MovieVO getMovie(int id);

  //Reactive
  Stream<List<MovieVO>> getNowPlayingMovieStream();
  List<MovieVO> getNowPlayingMovie();

  Stream<List<MovieVO>> getPopularMovieStream();
  List<MovieVO> getPopularMovie();

  Stream<List<MovieVO>> getShowCaseMovieStream();
  List<MovieVO> getShowCaseMovie();

  Stream<dynamic> getAllMovieEventStream();
}
