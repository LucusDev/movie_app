import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/features/home/view/widgets/play_button.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final controller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  double index = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        index = controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          colors: [
                            Constant.primaryColor,
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcATop,
                      child: CachedNetworkImage(
                        imageUrl: widget.imageList.elementAt(index),
                        fit: BoxFit.cover,
                        width: 1000.0,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: Text(
                        "The Wolverine 2013. Official Review.",
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 27,
                        ),
                      ),
                    ),
                    bottom: 15,
                    left: 0,
                    right: 0,
                  ),
                  const Center(
                    child: PlayButton(),
                  )
                ],
              );
            },
            itemCount: widget.imageList.length,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.filled(widget.imageList.length, 0)
                .asMap()
                .map(
                  (key, value) => MapEntry(
                    key,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 6,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Constant.secondColor,
                              borderRadius: BorderRadius.circular(500),
                            ),
                          ),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              gradient: LinearGradient(colors: [
                                Colors.grey.withOpacity(
                                    (key - index).abs().clamp(0, 1)),
                                Colors.grey.withOpacity(
                                    (key - index).abs().clamp(0, 1)),
                              ]),
                              borderRadius: BorderRadius.circular(500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        )
      ],
    );
  }
}
