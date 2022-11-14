import 'dart:core';
import 'package:final_project_ss_app/components/movie.dart';

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

//default user for testing feature implementation
User defaultUser = User(
  firstName: 'Kevin',
  lastName: 'yu',
  username: 'kyu',
  isAdult: true,
  listOfSavedMovie: [],
  listOfLikedMovie: [],
);
