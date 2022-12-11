import 'package:flutter/material.dart';
import 'dart:core';

class GenreSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal, children: _buildButtonWithNames());
  }

  List<TextButton> buttonList = <TextButton>[];

  List<Widget> _buildButtonWithNames() {
    for (var genre in genreMap.entries) {
      buttonList.add(
        TextButton(
          onPressed: () => {},
          child: Text(genre.value),
        ),
      );
    }
    return buttonList;
  }
}

Map<int, String> genreMap = {
  28: 'Action',
  12: 'Adventure',
  16: 'Animation',
  35: 'Comedy',
  80: 'Crime',
  18: 'Drama',
  10751: 'Family',
  14: 'Fantasy',
  36: 'History',
  27: 'Horror',
  10402: 'Music',
  9648: 'Mystery',
  10749: 'Romance',
  878: 'Science Fiction',
  53: 'Thriller',
  10752: 'War',
  37: 'Western',
};
