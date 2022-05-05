import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/features/detail/view/widgets/detail_header.dart';
import 'package:movie_app/features/navigate.dart';

class MovieCard extends StatelessWidget {
  final MovieVO movie;
  final bool isTop;
  const MovieCard({
    Key? key,
    required this.movie,
    this.isTop = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        navigateToMovieDetail(context, movie.id ?? 0);
      },
      child: AspectRatio(
        aspectRatio: 10 / 16,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AspectRatio(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: movie.posterPath?.getImageUrl ?? "",
                        fit: BoxFit.cover,
                        errorWidget:
                            (BuildContext context, String reason, dynamic _) {
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    if (isTop)
                      Positioned(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 9,
                          ),
                          child: const Text("TOP"),
                          decoration: BoxDecoration(
                            gradient: Constant.mainGradient,
                            borderRadius: BorderRadius.circular(500),
                          ),
                        ),
                        left: 10,
                        top: 10,
                      ),
                  ],
                ),
                aspectRatio: 15 / 20,
              ),
              Text(
                movie.title ?? (movie.originalTitle ?? ""),
                maxLines: 1,
              ),
              Row(
                children: [
                  Text((movie.voteAverage ?? 0).toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  ...getStar(movie.voteAverage)
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
