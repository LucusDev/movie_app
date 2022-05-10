import 'package:flutter/material.dart';
import 'package:movie_app/blocs/detail_bloc.dart';
import 'package:movie_app/core/constant.dart';
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
                              ? Scaffold(
                                  body: Center(
                                      child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Constant.primaryColorLight,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const CircularProgressIndicator(
                                      color: Constant.secondColorDark,
                                    ),
                                  )),
                                )
                              : Scaffold(
                                  body: SafeArea(
                                    child: CustomScrollView(
                                      shrinkWrap: true,
                                      slivers: [
                                        ///Detail Header
                                        DetailHeader(movie: movieDetail),

                                        ///Genre and Total Duration Section
                                        SliverToBoxAdapter(
                                            child: TimeGenreRow(
                                                movie: movieDetail)),

                                        ///StoryLine Section View
                                        SliverToBoxAdapter(
                                          child: StoryLine(
                                              storyline:
                                                  movieDetail.overview ?? ""),
                                        ),

                                        ///Actors Section
                                        SliverToBoxAdapter(
                                          child: PersonRow(
                                            type: "ACTORS",
                                            peopleList:
                                                movieDetail.credits.cast,
                                          ),
                                        ),

                                        ///Film Detail Section
                                        SliverToBoxAdapter(
                                            child:
                                                FilmDetail(movie: movieDetail)),

                                        ///Creators Section
                                        SliverToBoxAdapter(
                                          child: PersonRow(
                                            isMore: true,
                                            type: "CREATORS",
                                            peopleList:
                                                movieDetail.credits.crew,
                                          ),
                                        ),
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
