import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/features/detail/view/widgets/detail_button.dart';

class StoryLine extends StatelessWidget {
  const StoryLine({
    Key? key,
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
            "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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
