import 'package:final_project_ss_app/movie_components/movie_card.dart';

import '../movie_components/movie.dart';
import '../network/api_request.dart';

class SuggestionList {
  List<MovieCard> suggestionGenerator(List<Movie> movies) {
    List<MovieCard> listOfMovieCards = [];
    List<Movie> suggestions;
    int startIndex = 0;
    int endIndex = 15;
    suggestions = movies.sublist(startIndex, endIndex);
    for (Movie movie in suggestions) {
      listOfMovieCards.add(MovieCard(movie: movie));
    }
    return listOfMovieCards;
  }
}
