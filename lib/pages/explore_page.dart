import 'package:final_project_ss_app/movie_lists/horizontal_list.dart';
import 'package:final_project_ss_app/network/api_request.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  List trendingList = [];
  List popularList = [];

  @override
  void initState() {
    callPosterData();
    super.initState();
  }

  void callPosterData() async {
    //Page one is the top 20 movies
    var page = 1;
    var callPopList = await ApiResponse().fetchPopular(page);
    var callTrendList = await ApiResponse().fetchTrending();
    setState(() {
      trendingList = callTrendList;
      popularList = callPopList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        const Text(
          'Trending Movies',
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              height: 2),
        ),
        const SizedBox(
          height: 10,
        ),
        HorizontalMovieList(trending: trendingList),
        const Text(
          'Popular Movies',
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              height: 2),
        ),
        const SizedBox(
          height: 10,
        ),
        DisplayPopularMovieListHorizontally(popular: popularList),
      ],
    );
  }
}
