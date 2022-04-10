import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helper/helper.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/widgets/loading.dart';
import 'package:movie_app/features/detail/model/network/movie_repo.dart';
import 'package:movie_app/features/detail/view/detail_page.dart';
import 'package:movie_app/features/home/model/network/home_repo.dart';
import 'package:movie_app/features/home/view/widgets/play_button.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final controller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  final future = HomeRepo.getNowPlaying();
  double index = 0;
  @override
  void initState() {
    Constant.apiKey;
    super.initState();
    controller.addListener(() {
      setState(() {
        index = controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Result<List<Movie>>>(
        future: future,
        initialData: null,
        builder: (context, shot) {
          if (shot.data == null) {
            return const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          List<Movie> data = [];
          if (shot.data != null) {
            shot.data!.when(
              success: (value) {
                data = value;
              },
              error: (message) {},
            );
          }
          return Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: PageView.builder(
                  controller: controller,
                  itemBuilder: (context, index) {
                    final item = data.elementAt(index);
                    return GestureDetector(
                      onTap: () async {
                        try {
                          final data = await loading(
                            context,
                            MovieRepo.getMovieDetail(id: item.id ?? 0),
                          );
                          data.when(
                            success: (value) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return DetailPage(
                                    movieDetail: value,
                                  );
                                },
                              ));
                            },
                            error: (reason) {
                              if (kDebugMode) {
                                print(reason);
                              }
                            },
                          );
                        } catch (_) {}
                      },
                      child: Stack(
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
                                imageUrl: item.posterPath?.getImageUrl ?? "",
                                fit: BoxFit.cover,
                                width: 1000.0,
                                errorWidget: (BuildContext context,
                                    String reason, dynamic _) {
                                  return const SizedBox.shrink();
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                              ),
                              child: Text(
                                item.title ?? (item.originalTitle ?? ""),
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
                      ),
                    );
                  },
                  itemCount: data.length.clamp(0, 5),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.filled(data.length.clamp(0, 5), 0)
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
        });
  }
}
