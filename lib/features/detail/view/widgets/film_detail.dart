import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/core/models/movie.dart';

class FilmDetail extends StatefulWidget {
  final Movie movie;

  const FilmDetail({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<FilmDetail> createState() => _FilmDetailState();
}

class _FilmDetailState extends State<FilmDetail> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///About Film
          Text(
            "ABOUT FILM",
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
            ),
          ),

          ///Separator
          const SizedBox(
            height: 10,
          ),

          ///TItle
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
                  movie.originalTitle ?? "",
                ),
              ),
            ],
          ),

          ///Separator
          const SizedBox(
            height: 10,
          ),

          ///Movie Type
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
                  movie.genres?.map((e) => e.name).join(
                            " , ",
                          ) ??
                      "",
                ),
              ),
            ],
          ),

          ///Separator
          const SizedBox(
            height: 10,
          ),

          ///Production Widget
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
                  movie.productionCountries
                          ?.map((e) => e.name ?? "")
                          .join(" , ") ??
                      "",
                ),
              ),
            ],
          ),

          ///Separator
          const SizedBox(
            height: 10,
          ),

          ///Premire Date
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
                  movie.releaseDate?.date ?? "",
                ),
              ),
            ],
          ),

          ///Separator
          const SizedBox(
            height: 10,
          ),

          ///Description
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
                      movie.overview ?? "",
                      maxLines: isOpen ? 999 : 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(),
                    ),
                    if (hasTextOverflow(
                      text: movie.overview ?? "",
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
