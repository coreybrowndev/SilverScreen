import 'package:flutter/material.dart';

class MoviePopularityToStars {
  List<Widget> determineStarRating(double popularity) {
    const emptyStar = Icon(Icons.star_border);
    const filledStar = Icon(Icons.star);
    final List<Widget> starList = [filledStar];
    var i = 0;
    for (i; i < 4; i++) {
      starList.add(emptyStar);
    }
    if (_isOneStar(popularity)) {
      return starList;
    }
    if (_isTwoStar(popularity)) {
      starList[1] = filledStar;
      return starList;
    }
    starList[1] = filledStar;
    if (_isThreeStar(popularity)) {
      starList[2] = filledStar;
      return starList;
    }
    starList[2] = filledStar;
    if (_isFourStar(popularity)) {
      starList[3] = filledStar;
      return starList;
    }
    starList[3] = filledStar;
    if (_isFiveStar(popularity)) {
      starList[4] = filledStar;
      return starList;
    }
    return starList;
  }

  bool _isOneStar(popularity) {
    return popularity < (20.1);
  }

  bool _isTwoStar(popularity) {
    return popularity > (20.0) && popularity < (40.1);
  }

  bool _isThreeStar(popularity) {
    return popularity > (40.0) && popularity < (60.1);
  }

  bool _isFourStar(popularity) {
    return popularity > (60.0) && popularity < (80.1);
  }

  bool _isFiveStar(popularity) {
    return popularity > 80;
  }
}
