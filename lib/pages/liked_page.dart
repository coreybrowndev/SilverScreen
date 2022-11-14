import 'package:final_project_ss_app/components/movie.dart';
import 'package:final_project_ss_app/components/user.dart';
import 'package:final_project_ss_app/pages/suggestion_page.dart';
import 'package:flutter/material.dart';

import '../vertical_list_builder.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({super.key});

  @override
  LikedPageState createState() => LikedPageState();
}

class LikedPageState extends State<LikedPage> {
  final List<Movie> liked = defaultUser.listOfLikedMovie;
  final String loadingMessage = 'Title coming soon';

  @override
  Widget build(BuildContext context) {
    if (liked.isEmpty) {
      return const Center(
        child: Text(
          "Start swiping to add movie to your favorites",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return DisplayMovieListVertically(listOfMovie: liked);
    }
  }
}
