import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/features/home/view/widgets/play_button.dart';
import 'package:movie_app/features/navigate.dart';

class NowPlayingMovieSectionView extends StatefulWidget {
  final List<MovieVO> list;
  const NowPlayingMovieSectionView({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  State<NowPlayingMovieSectionView> createState() =>
      _NowPlayingMovieSectionViewState();
}

class _NowPlayingMovieSectionViewState
    extends State<NowPlayingMovieSectionView> {
  ///COntroller for page view
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
    final data = widget.list;
    return Column(
      children: [
        ///Now Playing Row
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              final item = data.elementAt(index);
              return NowPlayingRowItem(item: item);
            },
            itemCount: data.length.clamp(0, 5),
          ),
        ),

        Indicator(data: data, index: index)
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final List<MovieVO> data;
  final double index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                            Colors.grey
                                .withOpacity((key - index).abs().clamp(0, 1)),
                            Colors.grey
                                .withOpacity((key - index).abs().clamp(0, 1)),
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
    );
  }
}

class NowPlayingRowItem extends StatelessWidget {
  const NowPlayingRowItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MovieVO item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          navigateToMovieDetail(context, item.id ?? 0);
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
                errorWidget: (BuildContext context, String reason, dynamic _) {
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
  }
}
