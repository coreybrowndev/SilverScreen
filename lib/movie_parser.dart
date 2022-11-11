import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';

import 'movie.dart';

//Instance of movie object
class MovieParser {
  Movie parseMovie(Map<dynamic, dynamic> jsonData) {
    return Movie(
      genre: List<int>.from(jsonData['genre_ids']),
      isSuggested: false,
      isAdultContent: jsonData['adult'] as bool,
      movieId: jsonData['id'] as int,
      movieOverview: jsonData['overview'] as String,
      movieTitle: jsonData['title'] as String,
      releaseDate: jsonData['release_date'] as String,
      posterPath: jsonData['poster_path'] as String,
    );
  }
}
