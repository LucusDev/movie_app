import 'package:flutter/material.dart';

import 'package:movie_app/core/widgets/person_row.dart';
import 'package:movie_app/features/detail/model/models/movie_detail.dart';

import 'package:movie_app/features/detail/view/widgets/detail_header.dart';
import 'package:movie_app/features/detail/view/widgets/film_detail.dart';

import 'package:movie_app/features/detail/view/widgets/storyline.dart';
import 'package:movie_app/features/detail/view/widgets/time_genre_row.dart';

class DetailPage extends StatelessWidget {
  final MovieDetail movieDetail;
  const DetailPage({
    Key? key,
    required this.movieDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            DetailHeader(movie: movieDetail.movie),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  TimeGenreRow(movie: movieDetail.movie),
                  StoryLine(storyline: movieDetail.movie.overview ?? ""),
                  PersonRow(
                    type: "ACTORS",
                    peopleList: movieDetail.cast,
                  ),
                  FilmDetail(movie: movieDetail.movie),
                  PersonRow(
                    isMore: true,
                    type: "CREATORS",
                    peopleList: movieDetail.crew,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
