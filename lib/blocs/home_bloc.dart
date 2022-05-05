import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/model/movie_app_model.dart';
import 'package:movie_app/data/model/movie_app_model_impl.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/data/vos/people_vo.dart';

class HomeBloc extends ChangeNotifier {
  ///States
  List<MovieVO>? mNowPlayingMovieList;
  List<MovieVO>? mPopularFilmList;
  List<MovieVO>? mShowCaseList;
  List<PeopleVO>? mBestActorList;
  List<GenreVO>? mGenreList;
  List<MovieVO>? mMoviesByGenreList;

  String? error;

  final MovieAppModel _mModel = MovieAppModelImpl();

  HomeBloc() {
    fetch();
  }
  fetch() {
    ///Now Playing Fetch
    _mModel.getNowPlayingMoviesFromDatabase().listen((value) {
      mNowPlayingMovieList = value;
      notifyListeners();
    }).onError(_onError);

    ///Get Popular Fetch
    _mModel.getPopularMoviesFromDatabase().listen((result) {
      mPopularFilmList = result;
      notifyListeners();
    }).onError(_onError);

    ///Get ShowCases Fetch
    _mModel.getShowCaseMoviesFromDatabase().listen((result) {
      mShowCaseList = result;
      notifyListeners();
    }).onError(_onError);

    ///GetBest Actors Fetch
    _mModel.getBestActors().then((result) {
      mBestActorList = result;
      notifyListeners();
    }).onError(_onError);

    ///Get Genre Fetch
    _mModel.getGenres().then((result) {
      mGenreList = result;
      notifyListeners();

      ///Get Movies by Genre Fetch
      if (mGenreList != null) {
        _mModel.getMovieByGenre(mGenreList!.first.id ?? 0).then((result) {
          mMoviesByGenreList = result;
          notifyListeners();
        }).onError(_onError);
      }
    }).onError(_onError);
  }

  void cleanError() {
    error = null;
    notifyListeners();
  }

  void onGenreClick(int id) {
    mMoviesByGenreList = null;
    notifyListeners();
    _mModel.getMovieByGenre(id).then((result) {
      mMoviesByGenreList = result;
      notifyListeners();
    }).onError(_onError);
  }

  // ignore: prefer_void_to_null
  FutureOr<Null> _onError(Object error, dynamic _) {
    //Dont overrite error if already exists
    if (this.error != null) {
      return null;
    }
    //Handle different Error based on types
    switch (error.runtimeType) {
      case DioError:
        {
          this.error = (error as DioError).message;
          break;
        }
      default:
        {
          this.error = error.toString();
        }
    }
    notifyListeners();
  }

  void refresh() {
    mNowPlayingMovieList = null;
    mPopularFilmList = null;
    mShowCaseList = null;
    mBestActorList = null;
    mGenreList = null;
    mMoviesByGenreList = null;
    error = null;
    notifyListeners();
    fetch();
  }
}
