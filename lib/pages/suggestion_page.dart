import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:final_project_ss_app/movie_components/movie.dart';
import 'package:final_project_ss_app/network/api_request.dart';
import 'package:flutter/cupertino.dart';
import '../movie_components/movie_card.dart';
import '../movie_components/user.dart';

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
    var listOfMovies = await ResponseFromApi().parsePopular();
    setState(() {
      int startIndex = 0;
      int endIndex = 15;
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
    if (direction == AppinioSwiperDirection.right) {
      defaultUser.listOfLikedMovie.add(movieSuggestions[(index)]);
    } else if (direction == AppinioSwiperDirection.top) {
      defaultUser.listOfSavedMovie.add(movieSuggestions[(index)]);
    } else if (direction == AppinioSwiperDirection.left) {
      listOfDislikeGenre.add(movieSuggestions[(index)].genre);
    } else if (direction == AppinioSwiperDirection.bottom) {}
  }
}
