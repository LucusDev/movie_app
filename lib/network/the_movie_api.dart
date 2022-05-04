import 'package:dio/dio.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/response/best_actors_response.dart';
import 'package:movie_app/network/response/genre_response.dart';
import 'package:movie_app/network/response/movie_by_genre_response.dart';
import 'package:movie_app/network/response/movie_detail_response.dart';
import 'package:movie_app/network/response/now_playing_response.dart';
import 'package:movie_app/network/response/popular_movie_response.dart';
import 'package:movie_app/network/response/show_case_response.dart';
import 'package:retrofit/retrofit.dart';

part 'the_movie_api.g.dart';

@RestApi(
  baseUrl: kBaseUrl,
)
abstract class TheMovieApi {
  factory TheMovieApi(Dio dio, {String baseUrl}) = _TheMovieApi;

  @GET(kNowPlayingEndpoint)
  Future<NowPlayingResponse> getNowPlaying();

  @GET(kPopularMovieEndpoint)
  Future<PopularMovieResponse> getPopularMovies();

  @GET(kShowCaseMovieEndpoint)
  Future<ShowCaseResponse> getShowCaseMovie();

  @GET(kBestActorsEndpoint)
  Future<BestActorsResponse> getBestActors();

  @GET(kGenreEndpoint)
  Future<GenreResponse> getGenres();

  @GET(kMovieByGenreEndpoint)
  Future<MovieByGenreResponse> getMovieByGenre(
      @Query(kWithGenreParameter) String genreId);

  @GET(kMovieDetailEndpoint)
  Future<MovieDetailResponse> getMovieDetail(@Path() int id);
}
