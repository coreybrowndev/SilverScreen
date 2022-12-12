import 'dart:math';
import 'package:final_project_ss_app/movie_card/movie_card.dart';
import '../movie_constructors/movie.dart';

class SuggestionList {
  List<MovieCard> suggestionGenerator(List<Movie> movies) {
    List<MovieCard> listOfMovieCards = [];
    List<Movie> suggestions;
    int startIndex = Random().nextInt(86);
    int endIndex = startIndex + 14;
    suggestions = movies.sublist(startIndex, endIndex);
    for (Movie movie in suggestions) {
      listOfMovieCards.add(MovieCard(movie: movie));
    }
    return listOfMovieCards;
  }

  List<MovieCard> suggestionFilter(int genreID, List<Movie> movies) {
    List<Movie> filteredList = [];
    List<MovieCard> movieCards = [];
    for (Movie movie in movies) {
      final movieGenres = movie.genre.toSet();
      if (movieGenres.contains(genreID)) {
        filteredList.add(movie);
      }
    }
    for (Movie movie in filteredList) {
      movieCards.add(MovieCard(movie: movie));
    }
    return movieCards;
  }
}
