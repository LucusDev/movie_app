import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';

class PersonRow extends StatelessWidget {
  final bool isMore;
  final String type;
  final Color backgroundColor;
  const PersonRow({
    Key? key,
    this.isMore = false,
    required this.type,
    this.backgroundColor = Constant.primaryColorLight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                if (isMore)
                  Text(
                    "MORE $type",
                    style: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                top: 10,
                left: 15,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: ShaderMask(
                          shaderCallback: (bounds) {
                            return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Constant.primaryColor.withOpacity(0.9),
                                ],
                                stops: const [
                                  0.7,
                                  1,
                                ]).createShader(bounds);
                          },
                          blendMode: BlendMode.srcATop,
                          child: AspectRatio(
                            aspectRatio: 2 / 3,
                            child: CachedNetworkImage(
                              imageUrl: "/odVv1sqVs0KxBXiA8bhIBlPgalx.jpg"
                                  .getImageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 8,
                        top: 8,
                        child: Icon(Icons.favorite_border),
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Eddie Redmayne",
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.thumb_up,
                                      size: 15,
                                      color: Constant.secondColor
                                          .withOpacity(0.85),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "YOU LIKE 3 MOVIES",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                );
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 20,
      ),
    );
  }
}
