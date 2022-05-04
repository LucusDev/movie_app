import 'package:flutter/material.dart';
import 'package:movie_app/blocs/detail_bloc.dart';
import 'package:movie_app/core/widgets/dialog.dart' as dl;
import 'package:movie_app/core/widgets/person_row.dart';
import 'package:movie_app/data/vos/movie_detail_vo.dart';
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
          return Selector<DetailBloc, MovieDetailVO?>(
              selector: (context, bloc) => bloc.movieDetail,
              builder: (context, movieDetail, _) {
                return Selector<DetailBloc, String?>(
                    selector: (p0, p1) => p1.error,
                    builder: (context, message, _) {
                      return Stack(
                        children: [
                          movieDetail == null
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Scaffold(
                                  body: SafeArea(
                                    child: CustomScrollView(
                                      slivers: [
                                        ///Detail Header
                                        DetailHeader(movie: movieDetail),

                                        ///Convert Widgets to Sliver
                                        SliverList(
                                          delegate: SliverChildListDelegate(
                                            [
                                              ///Genre and Total Duration Section
                                              TimeGenreRow(movie: movieDetail),

                                              ///StoryLine Section View
                                              StoryLine(
                                                  storyline:
                                                      movieDetail.overview ??
                                                          ""),

                                              ///Actors Section
                                              PersonRow(
                                                type: "ACTORS",
                                                peopleList:
                                                    movieDetail.credits.cast,
                                              ),

                                              ///Film Detail Section
                                              FilmDetail(movie: movieDetail),

                                              ///Creators Section
                                              PersonRow(
                                                isMore: true,
                                                type: "CREATORS",
                                                peopleList:
                                                    movieDetail.credits.crew,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                          //Error Message Dialog
                          if (message != null)
                            Positioned.fill(
                              child: dl.Dialog(
                                  message: message,
                                  onOK: () {
                                    Provider.of<DetailBloc>(context,
                                            listen: false)
                                        .cleanError();
                                  }),
                            ),
                        ],
                      );
                    });
              });
        });
  }
}
