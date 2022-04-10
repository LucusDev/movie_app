import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:helper/helper.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/models/people.dart';

class HomeRepo {
  const HomeRepo._();

  static Future<Result<List<Movie>>> getNowPlaying() async {
    final link =
        "${Constant.url}/movie/now_playing?language=en-US&page=1".addApiKey;
    List<Movie> rV = [];

    try {
      final response = await http.get(Uri.parse(link));
      final data =
          (await compute(json.decode, response.body)) as Map<String, dynamic>;
      if (data["results"] == null) {
        return Result.success(rV);
      }

      rV = (data["results"] as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList();

      return Result.success(rV);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  static Future<Result<List<Movie>>> getPopular() async {
    final link =
        "${Constant.url}/movie/popular?language=en-US&page=1".addApiKey;
    List<Movie> rV = [];

    try {
      final response = await http.get(Uri.parse(link));
      final data =
          (await compute(json.decode, response.body)) as Map<String, dynamic>;
      if (data["results"] == null) {
        return Result.success(rV);
      }

      rV = (data["results"] as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList();

      return Result.success(rV);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  static Future<Result<List<Movie>>> getShowcases() async {
    final link =
        "${Constant.url}/movie/top_rated?language=en-US&page=1".addApiKey;
    List<Movie> rV = [];

    try {
      final response = await http.get(Uri.parse(link));
      final data =
          (await compute(json.decode, response.body)) as Map<String, dynamic>;
      if (data["results"] == null) {
        return Result.success(rV);
      }

      rV = (data["results"] as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList();

      return Result.success(rV);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  static Future<Result<List<People>>> getBestActors() async {
    final link =
        "${Constant.url}/person/popular?language=en-US&page=1".addApiKey;
    List<People> rV = [];

    try {
      final response = await http.get(Uri.parse(link));
      final data =
          (await compute(json.decode, response.body)) as Map<String, dynamic>;
      if (data["results"] == null) {
        return Result.success(rV);
      }

      rV = (data["results"] as List<dynamic>)
          .map((e) => People.fromJson(e))
          .toList();

      return Result.success(rV);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  static Future<Result<List<Genres>>> getGenres() async {
    final link = "${Constant.url}/genre/movie/list?language=en-US".addApiKey;
    List<Genres> rV = [];

    try {
      final response = await http.get(Uri.parse(link));
      final data =
          (await compute(json.decode, response.body)) as Map<String, dynamic>;
      if (data["genres"] == null) {
        return Result.success(rV);
      }

      rV = (data["genres"] as List<dynamic>)
          .map((e) => Genres.fromJson(e))
          .toList();

      return Result.success(rV);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  static Future<Result<List<Movie>>> getGenreMovie(int genreId) async {
    final link =
        "${Constant.url}/discover/movie?language=en-US&page=1&with_genres=$genreId"
            .addApiKey;
    List<Movie> rV = [];

    try {
      final response = await http.get(Uri.parse(link));
      final data =
          (await compute(json.decode, response.body)) as Map<String, dynamic>;
      if (data["results"] == null) {
        return Result.success(rV);
      }

      rV = (data["results"] as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList();

      return Result.success(rV);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
