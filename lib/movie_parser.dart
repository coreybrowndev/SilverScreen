import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';

import 'movie.dart';

//Instance of movie object
class MovieParser {
  Movie parseMovie(Map<dynamic, dynamic> json) {
    return Movie(
      genre: List<int>.from(json['genre_ids']),
      isSuggested: false,
      isAdultContent: json['adult'] as bool,
      movieId: json['id'] as int,
      movieOverview: json['overview'] as String,
      movieTitle: json['title'] as String,
      releaseDate: json['release_date'] as String,
      posterPath: json['poster_path'] as String,
    );
  }
}
