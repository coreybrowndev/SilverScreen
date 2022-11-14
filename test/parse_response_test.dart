import 'dart:convert';
import 'dart:io';
import 'package:final_project_ss_app/components/movie.dart';
import 'package:final_project_ss_app/components/movie_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  var response = await File('test/api_response.json').readAsString();
  var popularJson = jsonDecode(response);
  var movieData = popularJson['results'];
  List<Movie> listOfMovies = [];

  test('Able to create a movie object from the api response', () {
    for (Map<dynamic, dynamic> movieInfo in movieData) {
      var parse = MovieParser().parseMovie(movieInfo);
      listOfMovies.add(parse);
    }
    var answer = listOfMovies[0].movieTitle;

    expect(answer, 'Black Adam');
  });
}
