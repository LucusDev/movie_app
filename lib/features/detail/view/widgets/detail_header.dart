import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/constant.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: DetailHeaderDelegate(),
      pinned: true,
    );
  }
}

class DetailHeaderDelegate extends SliverPersistentHeaderDelegate {
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
                      0.7,
                      1,
                    ]).createShader(bounds);
              },
              child: CachedNetworkImage(
                imageUrl: "/odVv1sqVs0KxBXiA8bhIBlPgalx.jpg".getImageUrl,
                fit: BoxFit.cover,
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
                          child: Text("2016"),
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
                                  children: List.filled(
                                      5,
                                      const Icon(
                                        FontAwesomeIcons.solidStar,
                                        color: Colors.amber,
                                        size: 10,
                                      )),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "30000 VOTES",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.45),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "9,75",
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
                    child: const Text(
                      "this is the series aaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      maxLines: 2,
                      style: TextStyle(
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
            leading:
                //  Navigator.canPop(context)
                true
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
              child: const Text(
                "this is the series aaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                maxLines: 2,
                style: TextStyle(
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
