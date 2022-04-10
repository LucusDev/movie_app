import 'package:flutter/material.dart';
import 'package:helper/helper.dart';
import 'package:movie_app/core/models/people.dart';
import 'package:movie_app/core/widgets/person_row.dart';
import 'package:movie_app/features/home/model/network/home_repo.dart';

class BestActorRow extends StatefulWidget {
  const BestActorRow({Key? key}) : super(key: key);

  @override
  State<BestActorRow> createState() => _BestActorRowState();
}

class _BestActorRowState extends State<BestActorRow> {
  final future = HomeRepo.getBestActors();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Result<List<People>>>(
        future: future,
        initialData: null,
        builder: (context, shot) {
          if (shot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<People> list = [];
          shot.data!.when(
              success: (value) {
                list = value;
              },
              error: (message) {});
          return PersonRow(
            type: "BEST ACTORS",
            isMore: true,
            backgroundColor: Colors.transparent,
            peopleList: list,
          );
        });
  }
}
