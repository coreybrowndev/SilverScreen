import 'dart:core';
import 'package:final_project_ss_app/movie_constructors/movie.dart';

class User {
  List<Movie> listOfLikedMovie = [];
  List<Movie> listOfSavedMovie = [];

  User({
    required this.listOfLikedMovie,
    required this.listOfSavedMovie,
  });
}

//default user for testing feature implementation
User defaultUser = User(
  listOfSavedMovie: [],
  listOfLikedMovie: [],
);
