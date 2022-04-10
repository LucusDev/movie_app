import 'package:flutter/cupertino.dart';

class Constant {
  const Constant._();

  static const apiKey = "7643b9e0a173cd66dd8f0092da541ffe";
  static const apiKeyV4 =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NjQzYjllMGExNzNjZDY2ZGQ4ZjAwOTJkYTU0MWZmZSIsInN1YiI6IjYyNTAwMzA4NWEwN2Y1MDA5OTBiZGE1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3rboHcRajMUkfjb6bu4pved5xX4Hw5ABst2HWtTd7K8";

  static const primaryColor = Color.fromRGBO(21, 28, 37, 1);
  static const primaryColorLight = Color.fromRGBO(29, 37, 51, 1);

  static const secondColor = Color.fromRGBO(249, 200, 11, 1);
  static const secondColorDark = Color.fromRGBO(236, 172, 28, 1);
  static const mainGradient = LinearGradient(
    colors: [
      Constant.secondColorDark,
      Constant.secondColor,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

extension MovieImageExt on String {
  String get getImageUrl {
    return "http://image.tmdb.org/t/p/w500${this}";
  }
}
