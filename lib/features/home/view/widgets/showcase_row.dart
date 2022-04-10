import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/features/home/view/widgets/play_button.dart';

class ShowCaseRow extends StatefulWidget {
  final bool isMore;
  final String type;
  final Color backgroundColor;
  const ShowCaseRow({
    Key? key,
    this.isMore = true,
    required this.type,
    this.backgroundColor = Constant.primaryColorLight,
  }) : super(key: key);

  @override
  State<ShowCaseRow> createState() => _ShowCaseRowState();
}

class _ShowCaseRowState extends State<ShowCaseRow> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      isAlwaysShown: true,
      child: Container(
        color: widget.backgroundColor,
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
                    widget.type,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                  if (widget.isMore)
                    Text(
                      "MORE ${widget.type}",
                      style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 2 / 1,
              child: ListView.builder(
                controller: controller,
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
                        ShaderMask(
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
                          blendMode: BlendMode.srcATop,
                          child: AspectRatio(
                            aspectRatio: 1.5 / 1,
                            child: CachedNetworkImage(
                              imageUrl: "/odVv1sqVs0KxBXiA8bhIBlPgalx.jpg"
                                  .getImageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
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
                            )),
                        const Positioned.fill(
                          child: Center(
                            child: PlayButton(),
                          ),
                        )
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
      ),
    );
  }
}
