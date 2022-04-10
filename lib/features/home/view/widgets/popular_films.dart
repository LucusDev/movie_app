import 'package:flutter/material.dart';
import 'package:helper/helper.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/home/model/network/home_repo.dart';

import 'package:movie_app/features/home/view/widgets/movie_card.dart';

class PopularFilms extends StatelessWidget {
  const PopularFilms({
    Key? key,
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
          Text(
            "BEST POPULAR FILMS AND SERIALS",
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const AspectRatio(
            aspectRatio: 7 / 5,
            child: PopularFilmList(),
          )
        ],
      ),
    );
  }
}

class PopularFilmList extends StatefulWidget {
  const PopularFilmList({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularFilmList> createState() => _PopularFilmListState();
}

class _PopularFilmListState extends State<PopularFilmList> {
  final future = HomeRepo.getPopular();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Result<List<Movie>>>(
        initialData: null,
        future: future,
        builder: (context, shot) {
          if (shot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Movie> list = [];
          shot.data!.when(
              success: (value) {
                list = value;
              },
              error: (message) {});
          return ListView.builder(
            itemBuilder: (context, index) {
              return MovieCard(
                movie: list.elementAt(index),
                isTop: index == 0,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
          );
        });
  }
}
