import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/features/home/view/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int refreshCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: RefreshIndicator(
        color: Constant.secondColorDark,
        backgroundColor: Constant.primaryColorLight,
        onRefresh: () async {
          setState(() {
            refreshCount++;
          });
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(key: ValueKey(refreshCount)),
              PopularFilms(key: ValueKey(refreshCount + 1)),
              CheckMovieTime(key: ValueKey(refreshCount + 2)),
              GenreMovieRow(key: ValueKey(refreshCount + 3)),
              ShowCaseRow(type: "SHOWCASES", key: ValueKey(refreshCount + 4)),
              BestActorRow(key: ValueKey(refreshCount + 5)),
            ],
          ),
        ),
      )),
      appBar: AppBar(
        backgroundColor: Constant.primaryColor,
        title: const Text("Discover"),
        centerTitle: true,
        leading: const Icon(IcoFontIcons.alignLeft),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
            ),
          ),
        ],
      ),
    );
  }
}
