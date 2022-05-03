// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: avoid_print
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/network/data_agents/retrofit_agent_impl.dart';

void main() async {
  test("get now playing", () async {
    await RetrofitAgentImpl.get().getNowPlaying().then((value) {
      print(value.map((e) => e.toJson()).toString());
    });
  });
  test("get best actors", () async {
    await RetrofitAgentImpl.get().getBestActors().then((value) {
      print(value.map((e) => e.toJson()).toString());
    });
  });
  test("get Genres", () async {
    await RetrofitAgentImpl.get().getGenres().then((value) {
      print(value.map((e) => e.toJson()).toString());
    });
  });
  test("get movie by genre", () async {
    await RetrofitAgentImpl.get().getMovieByGenre(28).then((value) {
      print(value.map((e) => e.toJson()).toString());
    });
  });
  test("get popularmovies", () async {
    await RetrofitAgentImpl.get().getPopularMovies().then((value) {
      print(value.map((e) => e.toJson()).toString());
    });
  });
  test("get showcases", () async {
    await RetrofitAgentImpl.get().getShowCase().then((value) {
      print(value.map((e) => e.toJson()).toString());
    });
  });
  test("get movie detail", () async {
    await RetrofitAgentImpl.get().getMovieDetail(335787).then((value) {
      print(value.toJson());
    });
  });
}
