import 'package:final_project_ss_app/components/movie.dart';
import 'package:final_project_ss_app/horizontal_list_builder.dart';
import 'package:final_project_ss_app/network/api_request.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  List<Movie> trendingList = [];
  List<Movie> popularList = [];
  @override
  void initState() {
    callPosterData();
    super.initState();
  }

  void callPosterData() async {
    var callTrendList = await ResponseFromApi().fetchTrending();
    var callPopList = await ResponseFromApi().fetchPopular();
    setState(() {
      trendingList = callTrendList['results'];
      popularList = callPopList['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        DisplayMovieListHorizontally(listOfMovie: trendingList),
        DisplayMovieListHorizontally(listOfMovie: popularList),
      ],
    );
  }
}
