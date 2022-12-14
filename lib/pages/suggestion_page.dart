import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:final_project_ss_app/movie_constructors/movie.dart';
import 'package:final_project_ss_app/network/api_request.dart';
import 'package:flutter/material.dart';
import '../movie_card/movie_card.dart';
import '../movie_constructors/genre_map.dart';
import '../movie_constructors/user.dart';
import 'package:final_project_ss_app/movie_lists/suggestions_list.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({Key? key}) : super(key: key);

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  AppinioSwiperController controller = AppinioSwiperController();
  List<Movie> movieList = [];
  List<MovieCard> suggestionCards = [];
  static const deviceHeightRatio = 0.6;
  List<Movie> movieSuggestions = [];

  @override
  void initState() {
    super.initState();
    apiResponse();
  }

  Future apiResponse() async {
    var apiMovieList = await ApiResponse().parsePopular();
    setState(() {
      showDialog(context: context, builder: _directionsPopupDialog);
      movieList = apiMovieList;
      for (Movie movie in SuggestionList().suggestionGenerator(movieList)) {
        movieSuggestions.add(movie);
        suggestionCards.add(MovieCard(movie: movie));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
          child: genreSelection(),
        ),
        SizedBox(
          height: deviceHeight * deviceHeightRatio,
          child: AppinioSwiper(
            controller: controller,
            cards: suggestionCards,
            duration: const Duration(milliseconds: 500),
            maxAngle: 2,
            onSwipe: _swipe,
          ),
        )
      ],
    );
  }

  _swipe(int index, AppinioSwiperDirection direction) {
    if (direction == AppinioSwiperDirection.right) {
      defaultUser.listOfLikedMovie.add(movieSuggestions[(index)]);
    } else if (direction == AppinioSwiperDirection.top) {
      defaultUser.listOfSavedMovie.add(movieSuggestions[(index)]);
    } else {
      return;
    }
  }

  Widget _directionsPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('How to navigate through movies'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Swipe right to like a movie\n\n'
            'Swipe left to dislike a movie\n\n'
            'Swipe up to add the movie to your watched later list\n\n'
            'Select a Genre and start swiping',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildButtonWithNames() {
    List<TextButton> buttonList = <TextButton>[];
    for (var genre in GenreMap().genreMap.entries) {
      buttonList.add(
        TextButton(
          onPressed: () => buildSuggestions(genre.key),
          child: Text(genre.value),
        ),
      );
    }
    return buttonList;
  }

  void buildSuggestions(int genreID) {
    setState(() {
      suggestionCards = [];
      movieSuggestions = [];
      for (Movie movie
          in SuggestionList().suggestionFilter(genreID, movieList)) {
        suggestionCards.add(MovieCard(movie: movie));
      }
      movieSuggestions = SuggestionList().suggestionFilter(genreID, movieList);
    });
  }

  Widget genreSelection() => ListView(
      scrollDirection: Axis.horizontal, children: _buildButtonWithNames());
}
