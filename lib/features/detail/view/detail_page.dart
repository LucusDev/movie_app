import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/person_row.dart';
import 'package:movie_app/features/detail/view/widgets/widgets.dart';

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
