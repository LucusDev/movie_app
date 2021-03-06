import 'package:dio/dio.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_detail_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/data/vos/people_vo.dart';
import 'package:movie_app/network/data_agents/movie_app_data_agent.dart';
import 'package:movie_app/network/the_movie_api.dart';

class MovieAppDataAgentImpl extends MovieAppDataAgent {
  static final MovieAppDataAgentImpl _singleton = MovieAppDataAgentImpl._();
  final TheMovieApi movieClient = TheMovieApi(Dio());

  MovieAppDataAgentImpl._();

  factory MovieAppDataAgentImpl() => _singleton;

  @override
  Future<List<MovieVO>> getNowPlaying() async {
    return movieClient
        .getNowPlaying()
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<MovieVO>> getPopularMovies() async {
    return movieClient
        .getPopularMovies()
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<PeopleVO>> getBestActors() async {
    return movieClient
        .getBestActors()
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<GenreVO>> getGenres() async {
    return movieClient
        .getGenres()
        .asStream()
        .map((event) => event.genres)
        .first;
  }

  @override
  Future<List<MovieVO>> getMovieByGenre(int id) async {
    return movieClient
        .getMovieByGenre(id.toString())
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<MovieVO>> getShowCase() async {
    return movieClient
        .getShowCaseMovie()
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<MovieDetailVO> getMovieDetail(int id) async {
    return movieClient.getMovieDetail(id);
  }
}
