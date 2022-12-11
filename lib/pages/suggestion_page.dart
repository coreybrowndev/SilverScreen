import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:final_project_ss_app/movie_components/movie.dart';
import 'package:final_project_ss_app/network/api_request.dart';
import 'package:flutter/cupertino.dart';
import '../movie_components/movie_card.dart';
import '../movie_components/user.dart';
import 'package:final_project_ss_app/movie_lists/suggestions_list.dart';
import 'package:final_project_ss_app/movie_components/genre_select_widget.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({Key? key}) : super(key: key);

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  AppinioSwiperController controller = AppinioSwiperController();
  List<Movie> movieList = [];
  List<MovieCard> movieSuggestions = [];

  @override
  void initState() {
    apiResponse();
  }

  Future apiResponse() async {
    var apiMovieList = await ApiResponse().parsePopular();
    setState(() {
      movieList = apiMovieList;
      movieSuggestions = SuggestionList().suggestionGenerator(movieList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 70,
          child: GenreSelection(),
        ),
        SizedBox(
          height: 550,
          child: AppinioSwiper(
            controller: controller,
            cards: movieSuggestions,
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
      defaultUser.listOfLikedMovie.add(movieList[(index)]);
    } else if (direction == AppinioSwiperDirection.top) {
      defaultUser.listOfSavedMovie.add(movieList[(index)]);
    } else {
      return;
    }
  }
}
