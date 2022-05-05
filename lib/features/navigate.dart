import 'package:flutter/material.dart';
import 'package:movie_app/features/detail/view/detail_page.dart';

void navigateToMovieDetail(BuildContext context, int id) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return DetailPage(id: id);
    },
  ));
  // Navigator.of(context).push(PageRouteBuilder(
  //   opaque: true,
  //   pageBuilder: (context, a1, a2) {
  //     return DetailPage(
  //       id: id,
  //     );
  //   },
  // ));
}
