import 'dart:core';

import 'package:final_project_ss_app/components/movie.dart';

//Instance of user object that use as default user
class User {
  final String firstName = 'kevin';
  final String lastName = 'yu';
  final String username = 'kyu';
  var isAdult = true;
  List<Movie> listOfLikedMovie = [];
  List<Movie> listOfSavedMovie = [];
}
