import 'dart:async';

import 'package:dio/dio.dart';
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
    }).onError(_onError);
  }
  void cleanError() {
    error = null;
    notifyListeners();
  }

  // ignore: prefer_void_to_null
  FutureOr<Null> _onError(Exception error, dynamic _) {
    if (this.error == null) {
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
  }
}
