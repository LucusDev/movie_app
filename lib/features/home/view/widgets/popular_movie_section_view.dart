import 'package:flutter/material.dart';
import 'package:movie_app/core/models/movie.dart';

import 'package:movie_app/features/home/view/widgets/movie_card.dart';

class PopularMovieSectionView extends StatelessWidget {
  final List<Movie> list;
  const PopularMovieSectionView({
    Key? key,
    required this.list,
  }) : super(key: key);

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
          ///Title for popular films
          Text(
            "BEST POPULAR FILMS AND SERIALS",
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
            ),
          ),

          ///Separator
          const SizedBox(
            height: 20,
          ),

          ///List for popular films
          AspectRatio(
            aspectRatio: 7 / 5,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: list.elementAt(index),
                  isTop: index == 0,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
            ),
          )
        ],
      ),
    );
  }
}
