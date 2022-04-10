import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/models/people.dart';

class MovieDetail {
  final Movie movie;
  final List<People> crew;
  final List<People> cast;

  MovieDetail({
    required this.movie,
    this.crew = const [],
    this.cast = const [],
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    final movie = Movie.fromJson(json);
    List<People>? crew;
    List<People>? cast;
    final credits = json["credits"] as Map<String, dynamic>;
    if (credits['crew'] is List) {
      crew = credits["crew"] == null
          ? null
          : (credits["crew"] as List).map((e) => People.fromJson(e)).toList();
    }
    if (credits['cast'] is List) {
      cast = credits["cast"] == null
          ? null
          : (credits["cast"] as List).map((e) => People.fromJson(e)).toList();
    }
    return MovieDetail(movie: movie, crew: crew ?? [], cast: cast ?? []);
  }

  @override
  String toString() {
    return "${movie.toJson()}";
  }
}
