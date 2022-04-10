import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';

class CheckMovieTime extends StatelessWidget {
  const CheckMovieTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: BoxDecoration(
        color: Constant.primaryColorLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 15,
            width: MediaQuery.of(context).size.width * 0.6,
            child: const Text(
              "Check Movie Showtimes",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          const Positioned(
            bottom: 15,
            left: 15,
            child: Text(
              "SEE MORE",
              style: TextStyle(
                color: Constant.secondColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.asset(
              "assets/images/country.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width * 0.4,
            child: const Center(
              child: Icon(Icons.location_on, size: 50),
            ),
          ),
        ],
      ),
      margin: const EdgeInsets.all(15),
    );
  }
}
