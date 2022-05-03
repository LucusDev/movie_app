import 'package:flutter/material.dart';
import 'package:helper/helper.dart';
import 'package:movie_app/blocs/home_bloc.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/home/view/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class GenreMovieRow extends StatefulWidget {
  final List<Movie> list;
  final List<Genres> genres;
  const GenreMovieRow({
    Key? key,
    required this.list,
    required this.genres,
  }) : super(key: key);

  @override
  State<GenreMovieRow> createState() => _GenreMovieRowState();
}

class _GenreMovieRowState extends State<GenreMovieRow> {
  @override
  Widget build(BuildContext context) {
    final movieList = widget.list;

    return Column(
      children: [
        ///Genre Row
        GenreRow(genreList: widget.genres),

        ///Movie by Genre Row
        AspectRatio(
          aspectRatio: 3 / 2,
          child: movieList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movie: movieList.elementAt(index),
                      isTop: index == 0,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: movieList.length,
                ),
        ),
      ],
    );
  }
}

class GenreRow extends StatefulWidget {
  final List<Genres> genreList;
  const GenreRow({
    Key? key,
    required this.genreList,
  }) : super(key: key);

  @override
  State<GenreRow> createState() => _GenreRowState();
}

class _GenreRowState extends State<GenreRow> {
  Optional<int> currentGenre = const Optional.notAvaliable();
  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    final genreList = widget.genreList;
    return Container(
      color: Constant.primaryColorLight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...genreList.map((e) {
              return GenreTag(
                backgroundColor: Colors.transparent,
                onClick: () {
                  final bloc = Provider.of<HomeBloc>(context, listen: false);
                  bloc.onGenreClick(e.id ?? 0);
                  setState(() {
                    currentGenre = Optional.auto(e.id);
                  });
                },
                text: e.name ?? "",
                isActive: currentGenre.map(avaliable: (value) {
                  return value.value == (e.id ?? -99999);
                }, notAvaliable: (_) {
                  if (isFirst) {
                    currentGenre = Optional.auto(e.id);
                    isFirst = false;
                    return true;
                  }
                  return false;
                }),
              );
            })
          ],
        ),
      ),
    );
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
