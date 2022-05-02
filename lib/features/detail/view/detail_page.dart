import 'package:flutter/material.dart';
import 'package:movie_app/blocs/detail_bloc.dart';
import 'package:movie_app/core/widgets/person_row.dart';
import 'package:movie_app/features/detail/view/widgets/widgets.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final int id;
  const DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DetailBloc(id),
        builder: (context, child) {
          return Selector<DetailBloc, MovieDetail?>(
              selector: (context, bloc) => bloc.movieDetail,
              builder: (context, movieDetail, _) {
                return movieDetail == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Scaffold(
                        body: SafeArea(
                          child: CustomScrollView(
                            slivers: [
                              ///Detail Header
                              DetailHeader(movie: movieDetail.movie),

                              ///Convert Widgets to Sliver
                              SliverList(
                                delegate: SliverChildListDelegate(
                                  [
                                    ///Genre and Total Duration Section
                                    TimeGenreRow(movie: movieDetail.movie),

                                    ///StoryLine Section View
                                    StoryLine(
                                        storyline:
                                            movieDetail.movie.overview ?? ""),

                                    ///Actors Section
                                    PersonRow(
                                      type: "ACTORS",
                                      peopleList: movieDetail.cast,
                                    ),

                                    ///Film Detail Section
                                    FilmDetail(movie: movieDetail.movie),

                                    ///Creators Section
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
              });
        });
  }
}
