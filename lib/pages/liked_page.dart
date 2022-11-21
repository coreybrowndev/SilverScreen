import 'package:final_project_ss_app/movie_components/movie.dart';
import 'package:final_project_ss_app/movie_components/user.dart';
import 'package:flutter/material.dart';

import '../movie_lists//vertical_list.dart';

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
      return VerticalMovieList(listOfMovie: liked);
    }
  }
}
