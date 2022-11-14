import 'dart:convert';
import 'dart:io';
import 'package:final_project_ss_app/components/movie.dart';
import 'package:final_project_ss_app/components/movie_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final response = await File('test/api_response.json').readAsString();
  final popularJson = jsonDecode(response);
  final movieData = popularJson['results'];
  List<Movie> listOfMovies = [];

  test('Able to create a movie object from the api response', () {
    for (Map<dynamic, dynamic> movieInfo in movieData) {
      final parse = MovieParser().parseMovie(movieInfo);
      listOfMovies.add(parse);
    }
    final answer = listOfMovies[0].movieTitle;

    expect(answer, 'Black Adam');
  });
}
