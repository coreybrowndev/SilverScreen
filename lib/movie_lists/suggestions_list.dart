import 'dart:math';
import '../movie_constructors/movie.dart';

class SuggestionList {
  List<Movie> suggestionGenerator(List<Movie> movies) {
    List<Movie> suggestions;
    int startIndex = Random().nextInt(86);
    int endIndex = startIndex + 14;
    suggestions = movies.sublist(startIndex, endIndex);
    return suggestions;
  }

  List<Movie> suggestionFilter(int genreID, List<Movie> movies) {
    List<Movie> filteredList = [];
    for (Movie movie in movies) {
      final movieGenres = movie.genre.toSet();
      if (movieGenres.contains(genreID)) {
        filteredList.add(movie);
      }
    }
    return filteredList;
  }
}
