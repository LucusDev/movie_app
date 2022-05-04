import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/data/model/movie_app_model.dart';
import 'package:movie_app/data/model/movie_app_model_impl.dart';
import 'package:movie_app/data/vos/movie_detail_vo.dart';

class DetailBloc extends ChangeNotifier {
  MovieDetailVO? movieDetail;
  String? error;
  final MovieAppModel mModel = MovieAppModelImpl();
  DetailBloc(int id) {
    mModel.getMovieDetail(id).then((result) {
      movieDetail = result;
      notifyListeners();
    }).catchError(_onError);
  }
  void cleanError() {
    error = null;
    notifyListeners();
  }

  // ignore: prefer_void_to_null
  FutureOr<Null> _onError(dynamic error) {
    this.error = error.toString();
    notifyListeners();
  }
}
