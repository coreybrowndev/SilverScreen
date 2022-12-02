import 'dart:convert';
import 'dart:io';

import 'package:final_project_ss_app/movie_components/movie.dart';
import 'package:final_project_ss_app/movie_components/movie_parser.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'api_key.dart';

import 'package:http/http.dart' as http;

//Class allows for Api Data request
class ResponseFromApi {
  List<Movie> popularMovies = [];
  List<Movie> trendingMovies = [];
  String key = ApiKeyToken().key;
  String token = ApiKeyToken().token;

  // Pulling Api Information for Popular Movies
  Future<List<Movie>> parsePopular() async {
    TMDB apiResponse = TMDB(ApiKeys(key, token));
    for (var page = 1; page <= 5; page++) {
      var popularJson = await apiResponse.v3.movies.getPopular(page: page);
      var jsonResult = popularJson['results'];

      for (Map<dynamic, dynamic> movieData in jsonResult) {
        var movie = MovieParse().parseMovie(movieData);
        popularMovies.add(movie);
      }
    }
    print(popularMovies);
    return popularMovies;
  }

  TMDB accessApiResponse() {
    TMDB apiResponse = TMDB(ApiKeys(key, token));
    return apiResponse;
  }

  fetchTrending() async {
    var response = accessApiResponse();
    var trendingJson = await response.v3.trending.getTrending();
    return trendingJson;
  }

  fetchPopular() async {
    var response = accessApiResponse();
    var popularJson = await response.v3.movies.getPopular();
    return popularJson;
  }
}
