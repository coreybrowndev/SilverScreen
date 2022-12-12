import 'dart:convert';
import 'dart:io';
import 'package:final_project_ss_app/movie_constructors/movie.dart';
import 'package:final_project_ss_app/movie_constructors/movie_data_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final json = await File('test/api_response.json').readAsString();
  final trendingJson = jsonDecode(json);

  test('I can filter one genre from the list of movie', () {
    List<Movie> filteredList = [];
    List<int> userPreference = [28];
    var jsonResult = trendingJson['results'];
    List<Movie> movieList = [];

    for (Map<dynamic, dynamic> movieData in jsonResult) {
      var movieInstance = MovieParse().parseMovie(movieData);
      movieList.add(movieInstance);
    }

    for (Movie movie in movieList) {
      final movieGenres = movie.genre.toSet();
      if (movieGenres.intersection(userPreference.toSet()).isNotEmpty) {
        filteredList.add(movie);
      }
    }
    final answer = filteredList[0].movieTitle;
    expect(answer, "Black Adam");
  });
}
