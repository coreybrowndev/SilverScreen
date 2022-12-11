import 'dart:convert';
import 'dart:io';
import 'package:final_project_ss_app/movie_components/movie.dart';
import 'package:final_project_ss_app/movie_components/movie_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final json = await File('test/api_response.json').readAsString();
  final trendingList = jsonDecode(json);

  test('I can filter one genre from the list of movie', () {
    List<Movie> filteredList = [];
    List<int> userPreference = [28];
    var movieAsList = trendingList['results'];
    List<Movie> movieList = [];

    for (Map<dynamic, dynamic> movieData in movieAsList) {
      var movie = MovieParse().parseMovie(movieData);
      movieList.add(movie);
    }

    for (Movie movie in movieList) {
      final apiGenres = movie.genre.toSet();
      if (apiGenres.intersection(userPreference.toSet()).isNotEmpty) {
        filteredList.add(movie);
      }
    }
    final answer = filteredList[0].movieTitle;
    expect(answer, "Black Adam");
  });
}
