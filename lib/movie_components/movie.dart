import 'dart:core';

class Movie {
  final bool isAdultContent;
  final String movieTitle;
  final String movieOverview;
  final String releaseDate;
  final String posterPath;
  final List<int> genre;
  final double popularity;

  Movie({
    required this.isAdultContent,
    required this.movieTitle,
    required this.movieOverview,
    required this.releaseDate,
    required this.posterPath,
    required this.genre,
    required this.popularity,
  });
}
