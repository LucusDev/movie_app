import 'package:flutter/material.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/models/people.dart';
import 'package:movie_app/features/home/model/network/home_repo.dart';

class HomeBloc extends ChangeNotifier {
  ///States
  List<Movie>? mNowPlayingMovieList;
  List<Movie>? mPopularFilmList;
  List<Movie>? mShowCaseList;
  List<People>? mBestActorList;

  HomeBloc() {
    HomeRepo.getNowPlaying().then((result) {
      result.when(
          success: (value) {
            mNowPlayingMovieList = value;
            notifyListeners();
          },
          error: (message) {});
    });
    HomeRepo.getPopular().then((result) {
      result.when(
          success: (value) {
            mPopularFilmList = value;
            notifyListeners();
          },
          error: (message) {});
    });
    HomeRepo.getShowcases().then((result) {
      result.when(
          success: (value) {
            mShowCaseList = value;
            notifyListeners();
          },
          error: (message) {});
    });
    HomeRepo.getBestActors().then((result) {
      result.when(
          success: (value) {
            mBestActorList = value;
            notifyListeners();
          },
          error: (message) {});
    });
  }
}
