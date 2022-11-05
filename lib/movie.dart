import 'dart:core';
import 'package:final_project_ss_app/movie_parser.dart';
import 'network/api_request.dart';

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

  factory Movie.fromJson(Map<dynamic, dynamic> json) {
    final json = ResponseFromApi().fetchMovies();
    final movieData = ApiMovieData.fromJson(json);
    return Movie(
      genre: movieData.genre,
      isSuggested: movieData.isSuggested,
      isAdultContent: movieData.isAdultContent,
      movieId: movieData.movieId,
      movieOverview: movieData.movieOverview,
      movieTitle: movieData.movieTitle,
      releaseDate: movieData.releaseDate,
      posterPath: movieData.posterPath,
    );
  }
}
