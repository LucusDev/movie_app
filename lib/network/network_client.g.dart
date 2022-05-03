// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.themoviedb.org/3/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NowPlayingResult> getNowPlaying() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        NowPlayingResult>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/movie/now_playing?language=en-US&page=1&api_key=7643b9e0a173cd66dd8f0092da541ffe',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NowPlayingResult.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PopularMovieResult> getPopularMovies() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        PopularMovieResult>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/movie/popular?language=en-US&page=1&api_key=7643b9e0a173cd66dd8f0092da541ffe',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PopularMovieResult.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ShowCaseResult> getShowCaseMovie() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        ShowCaseResult>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/movie/top_rated?language=en-US&page=1&api_key=7643b9e0a173cd66dd8f0092da541ffe',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShowCaseResult.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BestActorsResult> getBestActors() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BestActorsResult>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/person/popular?language=en-US&page=1&api_key=7643b9e0a173cd66dd8f0092da541ffe',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BestActorsResult.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GenreResult> getGenres() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        GenreResult>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/genre/movie/list?language=en-US&api_key=7643b9e0a173cd66dd8f0092da541ffe',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenreResult.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MovieByGenreResult> getMovieByGenre(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        MovieByGenreResult>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/discover/movie?language=en-US&page=1&api_key=7643b9e0a173cd66dd8f0092da541ffe',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieByGenreResult.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
