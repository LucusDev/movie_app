import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:helper/helper.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/features/detail/model/models/movie_detail.dart';
import 'package:http/http.dart' as http;

class MovieRepo {
  const MovieRepo._();

  static Future<Result<MovieDetail>> getMovieDetail({required int id}) async {
    final link =
        "${Constant.url}/movie/$id?append_to_response=credits".addApiKey;
    try {
      final response = await http.get(Uri.parse(link));
      final data =
          (await compute(json.decode, response.body)) as Map<String, dynamic>;

      final movieDetail = MovieDetail.fromJson(data);
      return Result.success(movieDetail);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
