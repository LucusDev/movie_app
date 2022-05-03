import 'package:dio/dio.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/response/best_actors_result.dart';
import 'package:movie_app/network/response/genre_result.dart';
import 'package:movie_app/network/response/movie_by_genre_result.dart';
import 'package:movie_app/network/response/now_playing_result.dart';
import 'package:movie_app/network/response/popular_movie_result.dart';
import 'package:movie_app/network/response/show_case_result.dart';
import 'package:retrofit/retrofit.dart';

part 'network_client.g.dart';

@RestApi(
  baseUrl: baseUrl,
)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(getNowPlayingEndpoint)
  Future<NowPlayingResult> getNowPlaying();

  @GET(popularMovieEndpoint)
  Future<PopularMovieResult> getPopularMovies();

  @GET(showCaseMovieEndpoint)
  Future<ShowCaseResult> getShowCaseMovie();

  @GET(bestActorsEndpoint)
  Future<BestActorsResult> getBestActors();

  @GET(genreEndpoint)
  Future<GenreResult> getGenres();

  @GET(movieByGenreEndpoint)
  Future<MovieByGenreResult> getMovieByGenre(@Path("with_genres") String id);
}
