import 'package:flutter/material.dart';

import 'package:movie_app/core/widgets/person_row.dart';

import 'package:movie_app/features/detail/view/widgets/detail_header.dart';
import 'package:movie_app/features/detail/view/widgets/film_detail.dart';

import 'package:movie_app/features/detail/view/widgets/storyline.dart';
import 'package:movie_app/features/detail/view/widgets/time_genre_row.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const DetailHeader(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const TimeGenreRow(),
                  const StoryLine(),
                  const PersonRow(type: "ACTORS"),
                  const FilmDetail(),
                  const PersonRow(
                    isMore: true,
                    type: "CREATORS",
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
