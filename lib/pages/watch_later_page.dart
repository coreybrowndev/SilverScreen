import 'dart:io';

import 'package:final_project_ss_app/components/movie.dart';
import 'package:flutter/material.dart';

import '../components/user.dart';
import '../vertical_list_builder.dart';

class WatchLaterPage extends StatefulWidget {
  const WatchLaterPage({super.key});

  @override
  WatchLaterPageState createState() => WatchLaterPageState();
}

class WatchLaterPageState extends State<WatchLaterPage> {
  final List<Movie> watchLaterList = defaultUser.listOfSavedMovie;
  final String loadingMessage = 'Title coming soon';

  @override
  Widget build(BuildContext context) {
    return DisplayMovieListVertically(listOfMovie: watchLaterList);
  }
}
