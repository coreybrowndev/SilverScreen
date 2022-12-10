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

    if (_isOneStar(popularity)) {
      return starList;
    } else {
      return starList;
    }
  }

  bool _isOneStar(popularity) {
    return popularity <= (21.0);
  }
}
