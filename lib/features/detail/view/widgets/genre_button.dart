import 'package:flutter/material.dart';

class GenreButton extends StatelessWidget {
  final String text;
  const GenreButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 9,
      ),
      child: Text(text),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(37, 42, 50, 1),
        borderRadius: BorderRadius.circular(500),
      ),
    );
  }
}
