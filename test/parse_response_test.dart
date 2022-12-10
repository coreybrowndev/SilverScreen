import 'dart:convert';
import 'dart:io';
import 'package:final_project_ss_app/movie_components/movie.dart';
import 'package:final_project_ss_app/movie_components/movie_data_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final movieParserJsonMap = jsonDecode(
      await File('test/api_response.json').readAsString())['results'];
  final staticMovieTest = movieParserJsonMap[0];

  final manualMovieParse = Movie(
      genre: List<int>.from(staticMovieTest['genre_ids']),
      isAdultContent: staticMovieTest['adult'] as bool,
      movieOverview: staticMovieTest['overview'] as String,
      movieTitle: staticMovieTest['title'],
      releaseDate: staticMovieTest['release_date'] as String,
      popularity: (staticMovieTest["vote_average"] * 10.0 as double),
      posterPath:
          'https://image.tmdb.org/t/p/w500${staticMovieTest['poster_path']}');

  test('Movie parser object matches static movie object', () async {
    final parsedMovie = MovieParse().parseMovie(staticMovieTest);
    final answer = manualMovieParse.movieTitle;
    final expected = parsedMovie.movieTitle;
    expect(expected, answer);
  });
}
