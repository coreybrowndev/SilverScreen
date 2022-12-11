import 'package:flutter/material.dart';
import 'dart:core';

enum GenreName {
  action,
  adventure,
  animation,
  comedy,
  crime,
  documentary,
  drama,
  family,
  fantasy,
  history,
  horror,
  music,
  mystery,
  romance,
  scienceFiction,
  war,
  western,
  thriller,
}

class GenreSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal, children: _buildButtonWithNames());
  }

  List<TextButton> buttonList = <TextButton>[];

  // _getListData() {
  //   List<Widget> widgets = [];
  //   for (int i = 0; i < 100; i++) {
  //     widgets.add(Padding(
  //         padding: EdgeInsets.all(10.0),
  //         child: TextButton(
  //             onPressed: () => {},
  //             child: Column(
  //               // Replace with a Row for horizontal icon + text
  //               children: [
  //                 SizedBox(
  //                   child: _buildButtonWithNames(),
  //                 ),
  //               ],
  //             ))));
  //   }
  //   return widgets;
  // }

  List<String> myList =
      genreMap.values.map((value) => value.toString()).toList();

  List<Widget> _buildButtonWithNames() {
    for (int i = 0; i < genreMap.length; i++) {
      buttonList.add(TextButton(
          onPressed: () => {},
          child: Text(
            myList[i],
          )));
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
  99: 'Documentary',
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
