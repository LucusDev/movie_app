import 'package:flutter/material.dart';
import 'package:movie_app/features/detail/model/models/movie_detail.dart';
import 'package:movie_app/features/detail/model/network/movie_repo.dart';

class DetailBloc extends ChangeNotifier {
  MovieDetail? movieDetail;
  String? error;

  DetailBloc(int id) {
    MovieRepo.getMovieDetail(id: id).then((result) {
      result.when(
        success: (value) {
          movieDetail = value;
          notifyListeners();
        },
        error: (message) {
          error = message;
          notifyListeners();
        },
      );
    });
  }
  void cleanError() {
    error = null;
    notifyListeners();
  }
}
