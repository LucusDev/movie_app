import 'package:movie_app/data/model/movie_app_model.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_detail_vo.dart';
import 'package:movie_app/data/vos/people_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/data_agents/movie_app_data_agent_impl.dart';
import 'package:movie_app/persistent/dao/impls/genre_dao_impl.dart';
import 'package:movie_app/persistent/dao/impls/movie_dao_impl.dart';
import 'package:movie_app/persistent/dao/impls/people_dao_impl.dart';
import 'package:movie_app/persistent/movie_type_enum.dart';
import 'package:stream_transform/stream_transform.dart';

class MovieAppModelImpl extends MovieAppModel {
  static final MovieAppModelImpl _singleton = MovieAppModelImpl._();

  MovieAppModelImpl._();

  factory MovieAppModelImpl() => _singleton;

  final _mAgent = MovieAppDataAgentImpl();

  final _movieDao = MovieDaoImpl();

  final _genreDao = GenreDaoImpl();

  final _peopleDao = PeopleDaoImpl();

  @override
  Future<List<PeopleVO>> getBestActors() {
    return _mAgent.getBestActors().then((value) {
      _peopleDao.saveAllPeople(value);
      return value;
    });
  }

  @override
  Future<List<GenreVO>> getGenres() {
    return _mAgent.getGenres().then((value) {
      _genreDao.saveAllGenres(value);
      return value;
    });
  }

  @override
  Future<List<MovieVO>> getMovieByGenre(int id) {
    return _mAgent.getMovieByGenre(id).then((value) {
      // _movieDao.saveAllMovie(value);
      return value;
    });
  }

  @override
  Future<MovieDetailVO> getMovieDetail(int id) {
    return _mAgent.getMovieDetail(id).then((value) {
      // _movieDao.saveMovie(value);
      return value;
    });
  }

  @override
  void getNowPlaying() {
    _mAgent.getNowPlaying().then((value) {
      _movieDao.saveAllMovie(value.map((e) {
        e.type = MovieType.nowPlaying;
        return e;
      }).toList());
    });
  }

  @override
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
    getNowPlaying();
    return _movieDao
        .getAllMovieEventStream()
        .startWithStream(_movieDao.getNowPlayingMovieStream())
        .map((event) => _movieDao.getNowPlayingMovie());
  }

  @override
  void getPopularMovies() {
    _mAgent.getPopularMovies().then((value) {
      _movieDao.saveAllMovie(value.map((e) {
        e.type = MovieType.popular;
        return e;
      }).toList());
    });
  }

  @override
  Stream<List<MovieVO>> getPopularMoviesFromDatabase() {
    getPopularMovies();
    return _movieDao
        .getAllMovieEventStream()
        .startWithStream(_movieDao.getPopularMovieStream())
        .map((event) => _movieDao.getPopularMovie());
  }

  @override
  void getShowCase() {
    _mAgent.getShowCase().then((value) {
      _movieDao.saveAllMovie(value.map((e) {
        e.type = MovieType.showcase;
        return e;
      }).toList());
    });
  }

  @override
  Stream<List<MovieVO>> getShowCaseMoviesFromDatabase() {
    getShowCase();
    return _movieDao
        .getAllMovieEventStream()
        .startWithStream(_movieDao.getShowCaseMovieStream())
        .map((event) => _movieDao.getShowCaseMovie());
  }
}
