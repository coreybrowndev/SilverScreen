import 'package:final_project_ss_app/components/movie.dart';
import 'package:final_project_ss_app/components/movie_parser.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'api_key.dart';

//Class allows for Api Data request
class ResponseFromApi {
  List<Movie> popularMovies = [];
  List<Movie> trendingMovies = [];
  String key = ApiKeyToken().key;
  String token = ApiKeyToken().token;

  //Pulling Api Information
  Future<List<Movie>> fetchMovies() async {
    TMDB apiResponse = TMDB(ApiKeys(key, token));
    var popularJson = await apiResponse.v3.movies.getPopular();
    var jsonResult = popularJson['results'];

    for (Map<dynamic, dynamic> movieData in jsonResult) {
      var movie = MovieParser().parseMovie(movieData);
      popularMovies.add(movie);
    }
    // print(popularMovies);
    return popularMovies;
  }

  fetchTrending() async {
    TMDB response = TMDB(ApiKeys(key, token));
    var trendingResults = await response.v3.trending.getTrending();
    return trendingResults;
  }

  fetchPopular() async {
    TMDB response = TMDB(ApiKeys(key, token));
    var popularResults = await response.v3.movies.getPopular();
    return popularResults;
  }
}
