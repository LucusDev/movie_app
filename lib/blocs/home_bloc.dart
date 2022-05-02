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
  List<Genres>? mGenreList;
  List<Movie>? mMoviesByGenreList;

  HomeBloc() {
    ///Now Playing Fetch
    HomeRepo.getNowPlaying().then((result) {
      result.when(
          success: (value) {
            mNowPlayingMovieList = value;
            notifyListeners();
          },
          error: (message) {});
    });

    ///Get Popular Fetch
    HomeRepo.getPopular().then((result) {
      result.when(
          success: (value) {
            mPopularFilmList = value;
            notifyListeners();
          },
          error: (message) {});
    });

    ///Get ShowCases Fetch
    HomeRepo.getShowcases().then((result) {
      result.when(
          success: (value) {
            mShowCaseList = value;
            notifyListeners();
          },
          error: (message) {});
    });

    ///GetBest Actors Fetch
    HomeRepo.getBestActors().then((result) {
      result.when(
          success: (value) {
            mBestActorList = value;
            notifyListeners();
          },
          error: (message) {});
    });

    ///Get Genre Fetch
    HomeRepo.getGenres().then((result) {
      result.when(
          success: (value) {
            mGenreList = value;
            notifyListeners();
          },
          error: (message) {});

      ///Get Movies by Genre Fetch
      if (mGenreList != null) {
        HomeRepo.getGenreMovie(mGenreList!.first.id ?? 0).then((result) {
          result.when(
              success: (value) {
                mMoviesByGenreList = value;
                notifyListeners();
              },
              error: (message) {});
        });
      }
    });
  }

  void onGenreClick(int id) {
    mMoviesByGenreList = null;
    notifyListeners();
    HomeRepo.getGenreMovie(id).then((result) {
      result.when(
          success: (value) {
            mMoviesByGenreList = value;
            notifyListeners();
          },
          error: (message) {});
    });
  }
}
