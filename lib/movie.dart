import 'dart:core';
import 'package:final_project_ss_app/movie_parser.dart';
import 'network/api_request.dart';
import 'movie_parser.dart';

class Movie {
  late bool isAdultContent;
  late int movieId;
  late String movieTitle;
  late String movieOverview;
  late String releaseDate;
  late String posterPath;
  late bool isSuggested;
  late List<int> genre;

  Movie({
    required this.genre,
    required this.isSuggested,
    required this.isAdultContent,
    required this.movieId,
    required this.movieOverview,
    required this.movieTitle,
    required this.releaseDate,
    required this.posterPath,
  });
}
