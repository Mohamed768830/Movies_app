class ApiConstants {
  // Api.
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "f9b3e8ad084a2e63e7c47b2be8579362";

  // End points | Paths.
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  // Movie Details || Recommendation Movies.
  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
  static String recommendationMoviePath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  // Images Url.
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
