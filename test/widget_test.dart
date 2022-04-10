// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/detail/view/detail_page.dart';


void main() {
  testWidgets('tablet', (WidgetTester tester) async {
    final testableWidget =
        makeTestableWidget(child: DetailPage(), size: Size(1024, 768));
  });
  testWidgets('phone', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(Size(400, 320));

    final testableWidget =
        makeTestableWidget(child: const DetailPage(), size: Size(400, 320));
    await tester.pumpWidget(testableWidget);
  });
}

Widget makeTestableWidget({
  required Widget child,
  required Size size,
}) {
  return MaterialApp(
    home: MediaQuery(
        child: child,
        data: MediaQueryData(
          size: size,
        )),
  );
}
