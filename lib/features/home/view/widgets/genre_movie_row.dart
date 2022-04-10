import 'package:flutter/material.dart';
import 'package:helper/helper.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/home/model/network/home_repo.dart';
import 'package:movie_app/features/home/view/widgets/movie_card.dart';

class GenreMovieRow extends StatefulWidget {
  const GenreMovieRow({
    Key? key,
  }) : super(key: key);


  @override
  State<GenreMovieRow> createState() => _GenreMovieRowState();
}

class _GenreMovieRowState extends State<GenreMovieRow> {
  final future = HomeRepo.getGenres();
  Optional<int> currentGenre = const Optional.notAvaliable();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Result<List<Genres>>>(
        initialData: null,
        future: future,
        builder: (context, shot) {
          if (shot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Genres> list = [];
          shot.data!.when(
            success: (value) {
              list = value;
              currentGenre.whenOrNull(
                notAvaliable: () {
                  currentGenre = Optional.auto(value.first.id);
                },
              );
            },
            error: (message) {},
          );
          return Column(
            children: [
              Container(
                color: Constant.primaryColorLight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...list.asMap().values.map((e) {
                        return GenreTag(
                          backgroundColor: Colors.transparent,
                          onClick: () {
                            setState(() {
                              currentGenre = Optional.auto(e.id);
                            });
                          },
                          text: e.name ?? "",
                          isActive: currentGenre.map(avaliable: (value) {
                            return value.value == (e.id ?? -99999);
                          }, notAvaliable: (_) {
                            return false;
                          }),
                        );
                      })
                    ],
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 3 / 2,
                child: FutureBuilder<Result<List<Movie>>>(
                    future: currentGenre.map(avaliable: (value) {
                      return HomeRepo.getGenreMovie(value.value);
                    }, notAvaliable: (_) {
                      return null;
                    }),
                    initialData: null,
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
                          currentGenre.whenOrNull(
                            notAvaliable: () {
                              currentGenre = Optional.auto(value.first.id);
                            },
                          );
                        },
                        error: (message) {},
                      );
                      if (list.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: list.elementAt(index),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: list.length,
                      );
                    }),
              ),
            ],
          );
        });
  }
}

class GenreTag extends StatelessWidget {
  const GenreTag({
    Key? key,
    required this.onClick,
    this.backgroundColor,
    this.isActive = false,
    required this.text,
  }) : super(key: key);
  final VoidCallback onClick;
  final Color? backgroundColor;
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3,
            color: isActive ? Colors.amber : Colors.transparent,
          ),
        ),
      ),
      child: TextButton(
        onPressed: onClick,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.zero),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          )),
          elevation: MaterialStateProperty.all(0),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.4),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
