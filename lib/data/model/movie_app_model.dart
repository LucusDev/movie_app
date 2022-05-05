import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_detail_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/data/vos/people_vo.dart';

abstract class MovieAppModel {
  ///Network
  void getNowPlaying();
  void getPopularMovies();
  void getShowCase();

  Future<List<GenreVO>> getGenres();
  Future<List<PeopleVO>> getBestActors();
  Future<List<MovieVO>> getMovieByGenre(int id);
  Future<MovieDetailVO> getMovieDetail(int id);

  //Reactive
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase();
  Stream<List<MovieVO>> getPopularMoviesFromDatabase();
  Stream<List<MovieVO>> getShowCaseMoviesFromDatabase();
}
