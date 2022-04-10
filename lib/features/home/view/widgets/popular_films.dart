import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/features/detail/view/detail_page.dart';
import 'package:movie_app/features/home/view/widgets/movie_card.dart';

class PopularFilms extends StatelessWidget {
  const PopularFilms({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "BEST POPULAR FILMS AND SERIALS",
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AspectRatio(
            aspectRatio: 7 / 5,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return MovieCard(imageList: imageList);
              },
              scrollDirection: Axis.horizontal,
              itemCount: 40,
            ),
          )
        ],
      ),
    );
  }
}
