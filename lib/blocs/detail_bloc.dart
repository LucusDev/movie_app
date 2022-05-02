import 'package:flutter/material.dart';
import 'package:movie_app/features/detail/model/models/movie_detail.dart';
import 'package:movie_app/features/detail/model/network/movie_repo.dart';

class DetailBloc extends ChangeNotifier {
  MovieDetail? movieDetail;

  DetailBloc(int id) {
    MovieRepo.getMovieDetail(id: id).then((result) {
      result.when(
        success: (value) {
          movieDetail = value;
          notifyListeners();
        },
        error: (message) {},
      );
    });
  }
}
