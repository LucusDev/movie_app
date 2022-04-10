import 'package:flutter/material.dart';

class Constant {
  const Constant._();

  static const apiKey = "7643b9e0a173cd66dd8f0092da541ffe";

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

  static const url = "https://api.themoviedb.org/3";
}

extension MovieExt on String {
  String get getImageUrl {
    return "http://image.tmdb.org/t/p/w500${this}";
  }

  String get addApiKey {
    return "${this}&api_key=${Constant.apiKey}";
  }

  String get getYear {
    return split("-").first;
  }

  String get date {
    final String year = split("-").first;
    final int month = int.parse(split("-").elementAt(1));
    final int day = int.parse(split("-").elementAt(2));
    return "$day ${month.getMonth} $year";
  }
}

extension TimeExt on int {
  String get getMovieDuration {
    final hour = this / 60;
    final min = this - (hour.floor() * 60);
    return "${hour.floor()}h ${min.floor()}min";
  }

  String get getMonth {
    String month = "January";
    switch (this) {
      case 1:
        month = "January";
        break;
      case 2:
        month = "February";
        break;
      case 3:
        month = "March";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "August";
        break;
      case 9:
        month = "September";
        break;
      case 10:
        month = "October";
        break;
      case 11:
        month = "November";
        break;
      case 12:
        month = "December";
        break;
    }

    return month;
  }
}
