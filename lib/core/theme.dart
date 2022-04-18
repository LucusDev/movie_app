import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';

final theme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Constant.primaryColor,
  primaryColor: Constant.primaryColor,
  splashColor: Constant.primaryColorLight,
  colorScheme: const ColorScheme.dark(
    secondary: Constant.primaryColorLight,
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all(
      Constant.secondColor,
    ),
    thickness: MaterialStateProperty.all(2.5),
  ),

);
