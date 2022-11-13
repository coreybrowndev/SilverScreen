import 'package:final_project_ss_app/components/movie.dart';
import 'package:final_project_ss_app/pages/suggestion_page.dart';
import 'package:flutter/material.dart';

import '../vertical_list_builder.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({super.key});

  @override
  LikedPageState createState() => LikedPageState();
}

class LikedPageState extends State<LikedPage> {
  final List<Movie> liked = user.listOfLikedMovie;
  final String loadingMessage = 'Title coming soon';

  @override
  Widget build(BuildContext context) {
    return DisplayMovieListVertically(listOfMovie: liked);
  }
}
