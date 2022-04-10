import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/detail/view/widgets/genre_button.dart';

class TimeGenreRow extends StatelessWidget {
  final Movie movie;
  const TimeGenreRow({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5,
        children: [
          const Icon(
            MdiIcons.clockTimeTwoOutline,
            color: Constant.secondColor,
          ),
          Text(movie.runtime?.getMovieDuration ?? ""),
          const SizedBox(
            width: 5,
          ),
          ...movie.genres?.map((e) => GenreButton(text: e.name ?? "")) ?? [],
          const SizedBox(
            width: 5,
          ),
          const Icon(Icons.favorite_border),
        ],
      ),
    );
  }
}
