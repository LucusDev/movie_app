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

  String? error;

  HomeBloc() {
    fetch();
  }
  fetch() {
    ///Now Playing Fetch
    HomeRepo.getNowPlaying().then((result) {
      result.when(
        success: (value) {
          mNowPlayingMovieList = value;
          notifyListeners();
        },
        error: (message) {
          error = message;
          notifyListeners();
        },
      );
    });

    ///Get Popular Fetch
    HomeRepo.getPopular().then((result) {
      result.when(success: (value) {
        mPopularFilmList = value;
        notifyListeners();
      }, error: (message) {
        error = message;
        notifyListeners();
      });
    });

    ///Get ShowCases Fetch
    HomeRepo.getShowcases().then((result) {
      result.when(success: (value) {
        mShowCaseList = value;
        notifyListeners();
      }, error: (message) {
        error = message;
        notifyListeners();
      });
    });

    ///GetBest Actors Fetch
    HomeRepo.getBestActors().then((result) {
      result.when(success: (value) {
        mBestActorList = value;
        notifyListeners();
      }, error: (message) {
        error = message;
        notifyListeners();
      });
    });

    ///Get Genre Fetch
    HomeRepo.getGenres().then((result) {
      result.when(success: (value) {
        mGenreList = value;
        notifyListeners();
      }, error: (message) {
        error = message;
        notifyListeners();
      });

      ///Get Movies by Genre Fetch
      if (mGenreList != null) {
        HomeRepo.getGenreMovie(mGenreList!.first.id ?? 0).then((result) {
          result.when(success: (value) {
            mMoviesByGenreList = value;
            notifyListeners();
          }, error: (message) {
            error = message;
            notifyListeners();
          });
        });
      }
    });
  }

  void cleanError() {
    error = null;
    notifyListeners();
  }

  void onGenreClick(int id) {
    mMoviesByGenreList = null;
    notifyListeners();
    HomeRepo.getGenreMovie(id).then((result) {
      result.when(success: (value) {
        mMoviesByGenreList = value;
        notifyListeners();
      }, error: (message) {
        error = message;
        notifyListeners();
      });
    });
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

// class DataAgentImpl {
//   static DataAgentImpl? _singleton;
//   DataAgentImpl._(){
//     ///make dio object here
//   }
//   factory DataAgentImpl.get() {
//     _singleton ??= DataAgentImpl._();
//     return _singleton!;
//   }
// }

// final a = DataAgentImpl.get();
