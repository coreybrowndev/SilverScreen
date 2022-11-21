import 'dart:core';
import 'movie.dart';

class MovieParser {
  final String message = 'loading';
  Movie parseMovie(Map<dynamic, dynamic> jsonData) {
    return Movie(
        genre: List<int>.from(jsonData['genre_ids']),
        isAdultContent: jsonData['adult'] as bool,
        movieOverview: jsonData['overview'] as String,
        movieTitle: jsonData['title'],
        releaseDate: jsonData['release_date'] as String,
        popularity: jsonData["vote_average"].toString(),
        posterPath:
            'https://image.tmdb.org/t/p/w500${jsonData['poster_path']}');
  }
}
