import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:final_project_ss_app/components/movie.dart';
import 'package:final_project_ss_app/network/api_request.dart';
import 'package:flutter/cupertino.dart';

import '../components/movie_card.dart';
import '../components/user.dart';

User user = User(
  firstName: 'kev',
  lastName: 'Yu',
  username: 'kyu',
  isAdult: true,
  listOfSavedMovie: [],
  listOfLikedMovie: [],
);

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({Key? key}) : super(key: key);

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  AppinioSwiperController controller = AppinioSwiperController();
  List<Movie> movieSuggestions = [];
  List<MovieCard> listOfMovieCards = [];

  List listOfDislikeGenre = [];

  @override
  void initState() {
    super.initState();
    listOfMovie();
  }

  Future listOfMovie() async {
    var listOfMovies = await ResponseFromApi().fetchMovies();
    setState(() {
      int startIndex = 0;
      int endIndex = 14;
      movieSuggestions = listOfMovies.sublist(startIndex, endIndex);
      for (Movie movie in movieSuggestions) {
        listOfMovieCards.add(MovieCard(movie: movie));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppinioSwiper(
      controller: controller,
      cards: listOfMovieCards,
      duration: const Duration(milliseconds: 500),
      maxAngle: 2,
      onSwipe: _swipe,
    );
  }

  _swipe(int index, AppinioSwiperDirection direction) {
    user.listOfLikedMovie.toSet().toList();

    if (direction == AppinioSwiperDirection.right) {
      user.listOfLikedMovie.add(movieSuggestions[(index)]);
    } else if (direction == AppinioSwiperDirection.top) {
      user.listOfSavedMovie.add(movieSuggestions[(index)]);
    } else if (direction == AppinioSwiperDirection.left) {
      listOfDislikeGenre.add(movieSuggestions[(index)].genre);
    } else if (direction == AppinioSwiperDirection.bottom) {}
  }
}
