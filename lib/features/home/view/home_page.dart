import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/core/widgets/person_row.dart';
import 'package:movie_app/features/home/view/widgets/carousel_slider.dart';
import 'package:movie_app/features/home/view/widgets/check_movie_time.dart';
import 'package:movie_app/features/home/view/widgets/genre_movie_row.dart';
import 'package:movie_app/features/home/view/widgets/popular_films.dart';
import 'package:movie_app/features/home/view/widgets/showcase_row.dart';

class HomePage extends StatelessWidget {
  final List<String> imageList = const [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  ];
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(imageList: imageList),
            PopularFilms(imageList: imageList),
            const CheckMovieTime(),
            GenreMovieRow(imageList: imageList),
            const ShowCaseRow(type: "SHOWCASES"),
            const PersonRow(
              type: "BEST ACTORS",
              isMore: true,
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
      )),
      appBar: AppBar(
        backgroundColor: Constant.primaryColor,
        title: const Text("Discover"),
        centerTitle: true,
        leading: const Icon(IcoFontIcons.alignLeft),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(FontAwesomeIcons.magnifyingGlass),
          ),
        ],
      ),
    );
  }
}
