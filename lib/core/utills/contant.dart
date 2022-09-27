import 'dart:math';

//https://api.themoviedb.org/3/movie/610150?api_key=47a5882632510c50e01d28853cd434c6
class AppConstant {
  static const String BASE_URL = "https://api.themoviedb.org/3";
  static const String API_KEY = "47a5882632510c50e01d28853cd434c6";
  static const String getNowPlayingMove =
      "$BASE_URL/movie/now_playing?api_key=$API_KEY";
  static const String getPopularMovies =
      "$BASE_URL/movie/popular?api_key=$API_KEY&page=1";
  static String getTopRatedMovies(int index) =>
      "$BASE_URL/movie/top_rated?api_key=$API_KEY&page=$index";
  static const String getUpcomingMovie =
      "$BASE_URL/movie/upcoming?api_key=$API_KEY";
  //
  static String getRefreshPopularMovie(int index) =>
      "$BASE_URL/movie/popular?api_key=$API_KEY&page=$index";
  static String movieDetailsPath(int movieId) =>
      "$BASE_URL/movie/$movieId?api_key=$API_KEY";
  //https://api.themoviedb.org/3/movie/610150/recommendations?api_key=47a5882632510c50e01d28853cd434c6
  static String recommendationsMoviePath(int movieId) =>
      "$BASE_URL/movie/$movieId/recommendations?api_key=$API_KEY";

  //get movie cast
  static String getMovieCastPath(int movieId) =>
      "$BASE_URL/movie/$movieId/credits?api_key=$API_KEY&&language=en-US";
  //
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => '$baseImageUrl$path';
}