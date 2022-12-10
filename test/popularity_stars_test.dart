import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project_ss_app/movie_components/movie_popularity.dart';

void main() {
  const emptyStar = Icon(Icons.star_border);
  const filledStar = Icon(Icons.star);
  final List<Widget> oneStarList = [
    filledStar,
    emptyStar,
    emptyStar,
    emptyStar,
    emptyStar
  ];
  final List<Widget> twoStarList = [
    filledStar,
    filledStar,
    emptyStar,
    emptyStar,
    emptyStar
  ];
  final List<Widget> threeStarList = [
    filledStar,
    filledStar,
    filledStar,
    emptyStar,
    emptyStar
  ];
  final List<Widget> fourStarList = [
    filledStar,
    filledStar,
    filledStar,
    filledStar,
    emptyStar
  ];
  final List<Widget> fiveStarList = [
    filledStar,
    filledStar,
    filledStar,
    filledStar,
    filledStar
  ];

  final table = {
    19.0: oneStarList,
    33.0: twoStarList,
  };

  for (var rating in table.keys) {
    test('$rating has correct star list', () {
      var result = MoviePopularityToStars().displayRating(rating).toString();
      expect(table[rating].toString(), result);
    });
  }
}
