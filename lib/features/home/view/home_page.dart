import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:movie_app/blocs/home_bloc.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/core/widgets/dialog.dart' as dl;
import 'package:movie_app/core/widgets/person_row.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/data/vos/people_vo.dart';
import 'package:movie_app/features/home/view/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) => HomeBloc(),
      builder: (context, child) => child!,
      child: Scaffold(
        body: SafeArea(
            child: Selector<HomeBloc, String?>(selector: (p0, p1) {
          return p1.error;
        }, builder: (context, message, _) {
          return RefreshIndicator(
            onRefresh: () async {
              Provider.of<HomeBloc>(context, listen: false).refresh();
            },
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///NowPlayingMovie Section
                      Selector<HomeBloc, List<MovieVO>?>(
                          selector: (context, bloc) =>
                              bloc.mNowPlayingMovieList,
                          builder: (context, list, _) {
                            return list == null
                                ? const SizedBox(
                                    height: 200,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : NowPlayingMovieSectionView(list: list);
                          }),

                      ///Popular Section
                      Selector<HomeBloc, List<MovieVO>?>(
                          selector: (context, bloc) => bloc.mPopularFilmList,
                          builder: (context, list, _) {
                            return list == null
                                ? const SizedBox(
                                    height: 200,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : PopularMovieSectionView(list: list);
                          }),

                      ///CheckMovie Section
                      const CheckMovieTime(),

                      ///Genre Section
                      Selector<HomeBloc, List<GenreVO>?>(
                          selector: (context, bloc) => bloc.mGenreList,
                          builder: (context, genreList, _) {
                            return genreList == null
                                ? const SizedBox(
                                    height: 200,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : Selector<HomeBloc, List<MovieVO>?>(
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
                      Selector<HomeBloc, List<MovieVO>?>(
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
                      Selector<HomeBloc, List<PeopleVO>?>(
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

                ///Error Message Dialog
                if (message != null)
                  Positioned.fill(
                    child: dl.Dialog(
                        message: message,
                        onOK: () {
                          Provider.of<HomeBloc>(context, listen: false)
                              .cleanError();
                        }),
                  ),
              ],
            ),
          );
        })),
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
