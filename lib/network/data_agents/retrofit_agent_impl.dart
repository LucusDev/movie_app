import 'package:dio/dio.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/data/vos/people_vo.dart';
import 'package:movie_app/network/data_agents/retrofit_agent.dart';
import 'package:movie_app/network/network_client.dart';

class RetrofitAgentImpl extends RetrofitAgent {
  static RetrofitAgentImpl? singleton;
  final RestClient movieClient = RestClient(Dio());

  RetrofitAgentImpl._();

  factory RetrofitAgentImpl.get() {
    singleton ??= RetrofitAgentImpl._();
    return singleton!;
  }

  @override
  Future<List<MovieVO>> getNowPlaying() {
    return movieClient
        .getNowPlaying()
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<MovieVO>> getPopularMovies() {
    return movieClient
        .getPopularMovies()
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<PeopleVO>> getBestActors() {
    return movieClient
        .getBestActors()
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<GenreVO>> getGenres() {
    return movieClient
        .getGenres()
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<MovieVO>> getMovieByGenre(int id) {
    return movieClient
        .getMovieByGenre(id.toString())
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<MovieVO>> getShowCase() {
    return movieClient
        .getShowCaseMovie()
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<MovieVO> getMovieDetail(int id) {
    return movieClient.getMovieDetail(id);
  }
}
