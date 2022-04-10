import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/features/detail/view/widgets/detail_button.dart';

class StoryLine extends StatelessWidget {
  final String storyline;

  const StoryLine({
    Key? key,
    required this.storyline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "STORYLINE",
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            storyline,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              DetailButton(
                icon: Icon(
                  Icons.play_circle,
                  color: Colors.black.withOpacity(0.4),
                ),
                gradient: Constant.mainGradient,
                onPressed: () {},
                child: const Text("PLAY TRAILER"),
              ),
              const SizedBox(
                width: 10,
              ),
              DetailButton(
                isOutlined: true,
                icon: const Icon(
                  Icons.star,
                  color: Constant.secondColor,
                ),
                gradient: Constant.mainGradient,
                onPressed: () {},
                child: const Text("RATE MOVIE"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
