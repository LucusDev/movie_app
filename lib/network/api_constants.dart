const kBaseUrl = "https://api.themoviedb.org/3/";
const kApiKey = "7643b9e0a173cd66dd8f0092da541ffe";

const kNowPlayingEndpoint =
    "/movie/now_playing?language=en-US&page=1&api_key=$kApiKey";

const kPopularMovieEndpoint =
    "/movie/popular?language=en-US&page=1&api_key=$kApiKey";

const kShowCaseMovieEndpoint =
    "/movie/top_rated?language=en-US&page=1&api_key=$kApiKey";

const kBestActorsEndpoint =
    "/person/popular?language=en-US&page=1&api_key=$kApiKey";

const kGenreEndpoint = "/genre/movie/list?language=en-US&api_key=$kApiKey";

const kMovieByGenreEndpoint =
    "/discover/movie?language=en-US&page=1&api_key=$kApiKey";

const kMovieDetailEndpoint =
    "/movie/{id}?append_to_response=credits&api_key=$kApiKey";

const kWithGenreParameter = "with_genres";

