import 'dart:async';

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
  MovieAppModel mModel = MovieAppModelImpl();
  HomeBloc() {
    fetch();
  }
  fetch() {
    ///Now Playing Fetch

    mModel.getNowPlaying().then((result) {
      mNowPlayingMovieList = result;
      notifyListeners();
    }).onError(_onError);

    ///Get Popular Fetch
    mModel.getPopularMovies().then((result) {
      mPopularFilmList = result;
      notifyListeners();
    }).onError(_onError);

    ///Get ShowCases Fetch
    mModel.getShowCase().then((result) {
      mShowCaseList = result;
      notifyListeners();
    }).onError(_onError);

    ///GetBest Actors Fetch
    mModel.getBestActors().then((result) {
      mBestActorList = result;
      notifyListeners();
    }).onError(_onError);

    ///Get Genre Fetch
    mModel.getGenres().then((result) {
      mGenreList = result;
      notifyListeners();

      ///Get Movies by Genre Fetch
      if (mGenreList != null) {
        mModel.getMovieByGenre(mGenreList!.first.id ?? 0).then((result) {
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
    mModel.getMovieByGenre(id).then((result) {
      mMoviesByGenreList = result;
      notifyListeners();
    }).onError(_onError);
  }

  // ignore: prefer_void_to_null
  FutureOr<Null> _onError(dynamic error, dynamic _) {
    this.error = error.toString();
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
