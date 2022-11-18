import 'dart:core';

class Movie {
  final bool isAdultContent;
  final String movieTitle;
  final String movieOverview;
  final String releaseDate;
  final String posterPath;
  final List<int> genre;

  Movie({
    required this.genre,
    required this.isAdultContent,
    required this.movieOverview,
    required this.movieTitle,
    required this.releaseDate,
    required this.posterPath,
  });
}
