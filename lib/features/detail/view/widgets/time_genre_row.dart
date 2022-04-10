import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/features/detail/view/widgets/genre_button.dart';

class TimeGenreRow extends StatelessWidget {
  const TimeGenreRow({
    Key? key,
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
          Text("2h 13min"),
          const SizedBox(
            width: 5,
          ),
          GenreButton(text: "Family"),
          GenreButton(text: "Family"),
          GenreButton(text: "Family"),
          GenreButton(text: "Family"),
          GenreButton(text: "Family"),
          GenreButton(text: "Family"),
          const SizedBox(
            width: 5,
          ),
          const Icon(Icons.favorite_border),
        ],
      ),
    );
  }
}
