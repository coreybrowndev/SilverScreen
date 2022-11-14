import 'dart:convert';
import 'dart:io';
import 'package:final_project_ss_app/components/movie.dart';
import 'package:final_project_ss_app/components/movie_parser.dart';
import 'package:final_project_ss_app/pages/suggestion_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  List intList = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
  ];

  int startIndex = 0;
  int endIndex = 15;

  test('I can set a limit on the length of list', () {
    List fixedList = intList.sublist(startIndex, endIndex);
    final answer = fixedList.length;

    expect(answer, 15);
  });

  test('I can set a limit on the amount of movie suggested', () async {
    var response = await File('test/api_response.json').readAsString();
    var popularJson = jsonDecode(response);
    var movieData = popularJson['results'];
    List<Movie> listOfMovies = [];

    for (Map<dynamic, dynamic> movieInfo in movieData) {
      var parse = MovieParser().parseMovie(movieInfo);
      listOfMovies.add(parse);
    }

    final movieSuggestions = listOfMovies.sublist(startIndex, endIndex);
    final answer = movieSuggestions.length;

    expect(answer, 15);
  });
}
