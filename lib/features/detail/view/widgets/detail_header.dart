import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/core/models/movie.dart';

class DetailHeader extends StatelessWidget {
  final Movie movie;
  const DetailHeader({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: DetailHeaderDelegate(movie: movie),
      pinned: true,
    );
  }
}

class DetailHeaderDelegate extends SliverPersistentHeaderDelegate {
  DetailHeaderDelegate({
    required this.movie,
  });
  final Movie movie;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: (1 - shrinkOffset / (maxExtent)).clamp(0, 1),
            child: ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) {
                return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Constant.primaryColor,
                    ],
                    stops: [
                      0.4,
                      1,
                    ]).createShader(bounds);
              },
              child: CachedNetworkImage(
                imageUrl: movie.posterPath!.getImageUrl,
                fit: BoxFit.cover,
                errorWidget: (BuildContext context, String reason, dynamic _) {
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Opacity(
            opacity: (shrinkOffset / (maxExtent)).clamp(0, 1),
            child: Container(color: Constant.primaryColor),
          ),
        ),
        if (shrinkOffset < maxExtent * 0.4)
          Positioned.fill(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: (1 - shrinkOffset / (maxExtent * 0.5)).clamp(0, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 9,
                          ),
                          child: Text(movie.releaseDate?.getYear ?? ""),
                          decoration: BoxDecoration(
                            gradient: Constant.mainGradient,
                            borderRadius: BorderRadius.circular(500),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [...getStar(movie.voteAverage)],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "${movie.voteCount ?? 0} VOTES",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${movie.popularity?.round() ?? 0}",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.85),
                                fontSize: 50,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Opacity(
                    opacity: (1 - shrinkOffset / (maxExtent * 0.5)).clamp(0, 1),
                    child: Text(
                      movie.title ?? "",
                      maxLines: 2,
                      style: const TextStyle(
                        // color: Colors.amber,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
        Positioned(
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: Navigator.canPop(context)
                ? Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: const Icon(Icons.keyboard_arrow_left),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: Colors.black.withOpacity(0.7),
                        ),
                        padding: const EdgeInsets.all(5),
                      ),
                    ),
                  )
                : null,
            leadingWidth: 50,
            title: Opacity(
              opacity: ((shrinkOffset / (maxExtent * 0.5))).clamp(0, 1),
              child: Text(
                movie.title ?? "",
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.magnifyingGlass),
              )
            ],
          ),
          top: 0,
          left: 0,
          right: 0,
        )
      ],
    );
  }

  @override
  double get maxExtent => 265;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

List<Widget> getStar(double? average) {
  if (average == null) {
    return List.filled(
      5,
      const Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 15,
      ),
    );
  }
  final rating = average / 2;
  int fullStarCount = rating.floor();
  final isHalfStar = (rating - fullStarCount) != 0;

  final list = List.filled(
    5,
    const Icon(
      Icons.star_border,
      color: Colors.amber,
      size: 15,
    ),
    growable: true,
  );
  for (int i = 0; i < fullStarCount; i++) {
    list[i] = const Icon(
      Icons.star,
      color: Colors.amber,
      size: 15,
    );
  }
  if (isHalfStar) {
    list[fullStarCount] = const Icon(
      Icons.star_half,
      color: Colors.amber,
      size: 15,
    );
  }
  return list;
}
