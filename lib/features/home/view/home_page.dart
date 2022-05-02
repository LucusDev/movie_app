import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:movie_app/blocs/home_bloc.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/models/people.dart';
import 'package:movie_app/core/widgets/person_row.dart';
import 'package:movie_app/features/home/view/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int refreshCount = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) => HomeBloc(),
      builder: (context, child) => child!,
      child: Scaffold(
        body: SafeArea(
            child: RefreshIndicator(
          color: Constant.secondColorDark,
          backgroundColor: Constant.primaryColorLight,
          onRefresh: () async {
            // setState(() {
            //   refreshCount++;
            // });
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///NowPlayingMovie Section
                Selector<HomeBloc, List<Movie>?>(
                    selector: (context, bloc) => bloc.mNowPlayingMovieList,
                    builder: (context, list, _) {
                      return list == null
                          ? const SizedBox(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : CarouselSlider(data: list);
                    }),

                ///Popular Section
                Selector<HomeBloc, List<Movie>?>(
                    selector: (context, bloc) => bloc.mPopularFilmList,
                    builder: (context, list, _) {
                      return list == null
                          ? const SizedBox(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : PopularFilms(list: list);
                    }),

                ///CheckMovie Section
                const CheckMovieTime(),

                ///Genre Section
                Selector<HomeBloc, List<Genres>?>(
                    selector: (context, bloc) => bloc.mGenreList,
                    builder: (context, genreList, _) {
                      return genreList == null
                          ? const SizedBox(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Selector<HomeBloc, List<Movie>?>(
                              selector: (context, bloc) =>
                                  bloc.mMoviesByGenreList,
                              builder: (context, movielist, _) {
                                return GenreMovieRow(
                                  genres: genreList,
                                  list: movielist ?? [],
                                );
                              });
                    }),

                ///ShowCase Section
                Selector<HomeBloc, List<Movie>?>(
                    selector: (context, bloc) => bloc.mShowCaseList,
                    builder: (context, list, _) {
                      return list == null
                          ? const SizedBox(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : ShowCaseRow(
                              type: "SHOWCASES",
                              list: list,
                            );
                    }),

                ///BestActors Section
                Selector<HomeBloc, List<People>?>(
                    selector: (context, bloc) => bloc.mBestActorList,
                    builder: (context, list, _) {
                      return list == null
                          ? const SizedBox(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : PersonRow(
                              type: "BEST ACTORS",
                              isMore: true,
                              backgroundColor: Colors.transparent,
                              peopleList: list,
                            );
                    }),
              ],
            ),
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
              child: Icon(
                FontAwesomeIcons.magnifyingGlass,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
