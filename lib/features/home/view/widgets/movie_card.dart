import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helper/helper.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/core/widgets/loading.dart';
import 'package:movie_app/features/detail/view/detail_page.dart';

Future<Result<String>> a() async {
  await Future.delayed(Duration(seconds: 5));
  return Result.success("come on");
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await loading(context, a());
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const DetailPage();
          },
        ));
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
                        imageUrl: imageList.elementAt(3),
                        fit: BoxFit.cover,
                      ),
                    ),
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
                    )
                  ],
                ),
                aspectRatio: 15 / 20,
              ),
              Text(
                "WestWorld",
                maxLines: 1,
              ),
              Row(
                children: [
                  Text("8,20"),
                  const SizedBox(
                    width: 5,
                  ),
                  ...List.filled(
                      5,
                      Row(
                        children: const [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 10,
                          ),
                        ],
                      ))
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
