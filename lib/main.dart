import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/theme.dart';
import 'package:movie_app/data/vos/credits_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/data/vos/people_vo.dart';
import 'package:movie_app/data/vos/production_countries_vo.dart';
import 'package:movie_app/features/home/view/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/persistent/hive_constants.dart';
import 'package:movie_app/persistent/movie_type_enum.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CreditVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(PeopleVOAdapter());
  Hive.registerAdapter(ProductionCountriedVOAdapter());
  Hive.registerAdapter(MovieTypeEnumAdapter());

  await Hive.openBox<MovieVO>(kMovieVOBoxName);
  await Hive.openBox<PeopleVO>(kPeopleVOBoxName);
  await Hive.openBox<GenreVO>(kGenreVOBoxName);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await hiveInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomePage(),
    );
  }
}
