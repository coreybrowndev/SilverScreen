import 'package:flutter/material.dart';

class MoviePopularityToStars {
  List<Widget> displayRating(double popularity) {
    const emptyStar = Icon(Icons.star_border);
    const filledStar = Icon(Icons.star);
    final List<Widget> starList = [filledStar];
    var i = 0;
    for (i; i < 4; i++) {
      starList.add(emptyStar);
    }

    if (_isTwoStar(popularity)) {
      starList[1] = filledStar;
      return starList;
    }
    return starList;
  }

  bool _isTwoStar(popularity) {
    return popularity > (20.0) && popularity < (40.1);
  }
}
