import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';

class FilmDetail extends StatefulWidget {
  const FilmDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<FilmDetail> createState() => _FilmDetailState();
}

class _FilmDetailState extends State<FilmDetail> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ABOUT FILM",
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  "Original Title:",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  "aaaaaaa aaaaaa aaaaaaaaaaaaaaaaa aaaaaaaaa aaaaaaaaaaaa",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  "Type:",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  "aaaaaaa aaaaaa aaaaaaaaaaaaaaaaa aaaaaaaaa aaaaaaaaaaaa",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  "Production:",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  "aaaaaaa aaaaaa aaaaaaaaaaaaaaaaa aaaaaaaaa aaaaaaaaaaaa",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  "Premiere:",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  "aaaaaaa aaaaaa aaaaaaaaaaaaaaaaa aaaaaaaaa aaaaaaaaaaaa",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  "Description:",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Wrap(
                  children: [
                    Text(
                      "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      maxLines: isOpen ? 999 : 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(),
                    ),
                    if (hasTextOverflow(
                      text:
                          "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: const TextStyle(),
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ))
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isOpen = !isOpen;
                          });
                        },
                        child: Text(
                          isOpen ? "LESS" : "MORE",
                          style: const TextStyle(color: Constant.secondColor),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

bool hasTextOverflow({
  required String text,
  required TextStyle style,
  double minWidth = 0,
  double maxWidth = double.infinity,
  int maxLines = 5,
}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: maxLines,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: minWidth, maxWidth: maxWidth);
  return textPainter.didExceedMaxLines;
}
