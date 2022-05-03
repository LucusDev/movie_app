const baseUrl = "https://api.themoviedb.org/3/";
const apiKey = "7643b9e0a173cd66dd8f0092da541ffe";

const getNowPlayingEndpoint =
    "/movie/now_playing?language=en-US&page=1&api_key=$apiKey";

const popularMovieEndpoint =
    "/movie/popular?language=en-US&page=1&api_key=$apiKey";

const showCaseMovieEndpoint =
    "/movie/top_rated?language=en-US&page=1&api_key=$apiKey";

const bestActorsEndpoint =
    "/person/popular?language=en-US&page=1&api_key=$apiKey";

const genreEndpoint = "/genre/movie/list?language=en-US&api_key=$apiKey";

const movieByGenreEndpoint =
    "/discover/movie?language=en-US&page=1&api_key=$apiKey";
