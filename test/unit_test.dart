// ignore_for_file: avoid_print
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/network/data_agents/movie_app_data_agent_impl.dart';

void main() async {
  group("Network calls", () {
    test("get now playing", () async {
      await MovieAppDataAgentImpl().getNowPlaying().then((value) {
        print(value.map((e) => e.toJson()).toString());
      });
    });
    test("get best actors", () async {
      await MovieAppDataAgentImpl().getBestActors().then((value) {
        print(value.map((e) => e.toJson()).toString());
      });
    });
    test("get Genres", () async {
      await MovieAppDataAgentImpl().getGenres().then((value) {
        print(value.map((e) => e.toJson()).toString());
      });
    });
    test("get movie by genre", () async {
      await MovieAppDataAgentImpl().getMovieByGenre(28).then((value) {
        print(value.map((e) => e.toJson()).toString());
      });
    });
    test("get popularmovies", () async {
      await MovieAppDataAgentImpl().getPopularMovies().then((value) {
        print(value.map((e) => e.toJson()).toString());
      });
    });
    test("get showcases", () async {
      await MovieAppDataAgentImpl().getShowCase().then((value) {
        print(value.map((e) => e.toJson()).toString());
      });
    });
    test("get movie detail", () async {
      await MovieAppDataAgentImpl().getMovieDetail(335787).then((value) {
        print(value.toJson());
      });
    });
  });
}
