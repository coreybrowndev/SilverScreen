import 'dart:convert';
import 'dart:io';
import 'package:final_project_ss_app/movie_components/movie.dart';
import 'package:final_project_ss_app/movie_components/movie_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final movieData = jsonDecode(
      await File('test/api_response.json').readAsString())['results'];
  final List<Movie> listOfMovies = [];
  for (Map<dynamic, dynamic> movieInfo in movieData) {
    final parsedMovie = MovieParse().parseMovie(movieInfo);
    listOfMovies.add(parsedMovie);
  }

  test('Able to create a movie object from the api response', () {
    final answer = listOfMovies[0].movieTitle;
    expect(answer, 'Black Adam');
  });

  test('Pull the popularity from api_response.json', () {
    final answer = listOfMovies[0].popularity;
    expect(answer, '6.9');
  });
}
