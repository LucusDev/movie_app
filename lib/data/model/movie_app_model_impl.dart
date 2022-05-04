import 'package:movie_app/data/model/movie_app_model.dart';
import 'package:movie_app/data/vos/movie_detail_vo.dart';
import 'package:movie_app/data/vos/people_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/network/data_agents/movie_app_data_agent_impl.dart';

class MovieAppModelImpl extends MovieAppModel {
  static final MovieAppModelImpl _singleton = MovieAppModelImpl._();
  final MovieAppDataAgentImpl mAgent = MovieAppDataAgentImpl();
  MovieAppModelImpl._();
  factory MovieAppModelImpl() => _singleton;
  @override
  Future<List<PeopleVO>> getBestActors() {
    return mAgent.getBestActors();
  }

  @override
  Future<List<GenreVO>> getGenres() {
    return mAgent.getGenres();
  }

  @override
  Future<List<MovieVO>> getMovieByGenre(int id) {
    return mAgent.getMovieByGenre(id);
  }

  @override
  Future<MovieDetailVO> getMovieDetail(int id) {
    return mAgent.getMovieDetail(id);
  }

  @override
  Future<List<MovieVO>> getNowPlaying() {
    return mAgent.getNowPlaying();
  }

  @override
  Future<List<MovieVO>> getPopularMovies() {
    return mAgent.getPopularMovies();
  }

  @override
  Future<List<MovieVO>> getShowCase() {
    return mAgent.getShowCase();
  }
}
