import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/features/home/view/widgets/movie_card.dart';

class GenreMovieRow extends StatelessWidget {
  const GenreMovieRow({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Constant.primaryColorLight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GenreTag(
                  backgroundColor: Colors.transparent,
                  onClick: () {},
                  text: "Adventure",
                  isActive: true,
                ),
                ...List.filled(20, "Action").asMap().values.map((e) {
                  return GenreTag(
                    backgroundColor: Colors.transparent,
                    onClick: () {},
                    text: e,
                    isActive: false,
                  );
                })
              ],
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 3 / 2,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return MovieCard(imageList: imageList);
            },
            scrollDirection: Axis.horizontal,
            itemCount: 20,
          ),
        ),
      ],
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
