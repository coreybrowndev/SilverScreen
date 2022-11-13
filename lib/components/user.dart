import 'dart:core';

import 'package:final_project_ss_app/components/movie.dart';

//Instance of user object
class User {
  final String firstName;
  final String lastName;
  final String username;
  var isAdult = false;
  List<Movie> listOfLikedMovie = [];
  List<Movie> listOfSavedMovie = [];

  User({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.isAdult,
    required this.listOfLikedMovie,
    required this.listOfSavedMovie,
  });
}
