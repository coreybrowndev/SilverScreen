import 'package:final_project_ss_app/movie_parser.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'api_key.dart';

//Class allows for Api Data request
class ResponseFromApi {
  List<ApiMovieData> popularMovies = [];
  List<ApiMovieData> trendingMovies = [];
  String key = ApiKeyToken().key;
  String token = ApiKeyToken().token;

  //Pulling Api Information
  fetchMovies() async {
    TMDB apiResponse = TMDB(ApiKeys(key, token));
    var popularData = await apiResponse.v3.movies.getPopular();
    popularMovies = popularData['results']
        .map<ApiMovieData>((x) => ApiMovieData.fromJson(x))
        .toList();
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

  parser() async {
    final json = fetchMovies();
    final movieData = ApiMovieData.fromJson(json);
  }
}
