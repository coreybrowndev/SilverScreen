import 'package:tmdb_api/tmdb_api.dart';
import 'package:silver_screen/movie_responsibilities/movie.dart';
import 'package:silver_screen/network/api_key_token.dart';

//Class allows for Api Data request
class ApiRequest {
  List<MovieData> popularMovies = [];
  List<MovieData> trendingMovies = [];
  final String apiKey = ApiKeyToken().key;
  final String apiToken = ApiKeyToken().token;

  //Pulling Api Information
  Future<List<MovieData>> fetchMovies() async {
    TMDB apiResponse = TMDB(ApiKeys(apiKey, apiToken));
    var popularData = await apiResponse.v3.movies.getPopular();
    popularMovies = popularData['results']
        .map<MovieData>((x) => MovieData.fromJson(x))
        .toList();

    print(popularMovies);
    return popularMovies;
  }

  fetchTrending() async {
    TMDB response = TMDB(ApiKeys(apiKey, apiToken));
    var trendingResults = await response.v3.trending.getTrending();
    return trendingResults;
  }

  fetchPopular() async {
    TMDB response = TMDB(ApiKeys(apiKey, apiToken));
    var popularResults = await response.v3.movies.getPopular();
    return popularResults;
  }
}
