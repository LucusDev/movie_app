import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/data/vos/people_vo.dart';

abstract class RetrofitAgent {
  Future<List<MovieVO>> getNowPlaying();
  Future<List<MovieVO>> getPopularMovies();
  Future<List<PeopleVO>> getBestActors();
  Future<List<GenreVO>> getGenres();
  Future<List<MovieVO>> getMovieByGenre(int id);
  Future<List<MovieVO>> getShowCase();
  Future<MovieVO> getMovieDetail(int id);
  
}
