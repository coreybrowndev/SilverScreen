import 'dart:core';
import 'package:final_project_ss_app/movie_parser.dart';
import 'network/api_request.dart';
import 'movie_parser.dart';

class Movie {
  final bool isAdultContent;
  final int movieId;
  final String movieTitle;
  final String movieOverview;
  final String releaseDate;
  final String posterPath;
  final bool isSuggested;
  final List<int> genre;

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
