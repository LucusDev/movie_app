import 'package:dio/dio.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/data/vos/people_vo.dart';
import 'package:movie_app/network/data_agents/retrofit_agent.dart';
import 'package:movie_app/network/network_client.dart';

class RetrofitAgentImpl extends RetrofitAgent {
  final RestClient movierepo = RestClient(Dio());

  @override
  Future<List<MovieVO>> getNowPlaying() {
    return movierepo
        .getNowPlaying()
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<MovieVO>> getPopularMovies() {
    return movierepo
        .getPopularMovies()
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<PeopleVO>> getBestActors() {
    return movierepo
        .getBestActors()
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<GenreVO>> getGenres() {
    return movierepo.getGenres().asStream().map((event) => event.results).first;
  }

  @override
  Future<List<MovieVO>> getMovieByGenre(int id) {
    return movierepo
        .getMovieByGenre(id.toString())
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<MovieVO>> getShowCase() {
    return movierepo
        .getShowCaseMovie()
        .asStream()
        .map((event) => event.results)
        .first;
  }
}
