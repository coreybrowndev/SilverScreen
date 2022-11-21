import 'package:final_project_ss_app/movie_components/movie.dart';
import 'package:flutter/material.dart';
import '../movie_components/user.dart';
import '../movie_lists//vertical_list.dart';

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
    if (watchLaterList.isEmpty) {
      return const Center(
        child: Text(
          "Start swiping to add movie to your watch later list",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return VerticalMovieList(listOfMovie: watchLaterList);
    }
  }
}
