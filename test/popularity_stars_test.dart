import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project_ss_app/movie_components/movie_popularity.dart';

void main() {
  const emptyStar = Icon(Icons.star_border);
  const filledStar = Icon(Icons.star);
  final List<Widget> starList = [filledStar];
  var i = 0;
  for (i; i < 4; i++) {
    starList.add(emptyStar);
  }
  final table = {
    19.0: starList,
  };

  for (var rating in table.keys) {
    test('$rating has correct star list', () {
      var result = MoviePopularityToStars().displayRating(rating).toString();
      expect(table[rating].toString(), result);
    });
  }
}
