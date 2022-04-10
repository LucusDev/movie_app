
import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: Constant.mainGradient,
        borderRadius: BorderRadius.circular(500),
      ),
      child: Icon(
        Icons.play_arrow,
        color: Colors.black.withOpacity(0.6),
        size: 30,
      ),
    );
  }
}
