import 'package:flutter/material.dart';
import 'package:helper/helper.dart';
import 'package:movie_app/core/constant.dart';

class LoadingScreen<E> extends StatelessWidget {
  const LoadingScreen({
    Key? key,
    required this.future,
  }) : super(key: key);
  final Future<Result<E>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot<Result<E>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Navigator.of(context).pop(snapshot.data);
            return const SizedBox();
          }
          return Scaffold(
            backgroundColor: Constant.primaryColor.withOpacity(0.3),
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Constant.primaryColorLight,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const CircularProgressIndicator(
                  color: Constant.secondColorDark,
                ),
              ),
            ),
          );
        });
  }
}

Future<Result<E>> loading<E>(
    BuildContext context, Future<Result<E>> future) async {
  final result = await Navigator.of(context).push<Result<E>>(PageRouteBuilder(
    opaque: false,
    pageBuilder: (context, animation, secondaryAnimation) {
      return LoadingScreen(
        future: future,
      );
    },
  ));
  if (result == null) {
    return Result.error(NullThrownError().toString());
  }
  return result;
}
