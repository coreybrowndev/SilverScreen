import 'package:final_project_ss_app/movie_components/movie.dart';
import 'package:final_project_ss_app/movie_components/movie_parser.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'api_key.dart';

//Class allows for Api Data request
class ApiResponse {
  List<Movie> popularMovies = [];
  List<Movie> trendingMovies = [];
  String key = ApiKeyToken().key;
  String token = ApiKeyToken().token;

  // Pulling Api Information for Popular Movies
  Future<List<Movie>> parsePopular() async {
    for (var page = 1; page <= 5; page++) {
      var popularJson = await fetchPopular(page);
      for (Map<dynamic, dynamic> movieData in popularJson) {
        var movie = MovieParse().parseMovie(movieData);
        popularMovies.add(movie);
      }
    }
    return popularMovies;
  }

  TMDB accessApiResponse() {
    TMDB apiResponse = TMDB(ApiKeys(key, token));
    return apiResponse;
  }

  fetchTrending() async {
    var response = accessApiResponse();
    var jsonResult = await response.v3.trending.getTrending();
    var trendingJson = jsonResult['results'];
    return trendingJson;
  }

  fetchPopular(int page) async {
    var response = accessApiResponse();
    var jsonResult = await response.v3.movies.getPopular(page: page);
    var popularJson = jsonResult['results'];
    return popularJson;
  }
}
