import 'package:flutter/material.dart';
import 'package:final_project_ss_app/movie_components/movie.dart';
import 'package:final_project_ss_app/movie_components/movie_card_containers.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    const deviceHeightRatio = 0.6;
    const deviceWidthRatio = 0.85;
    const circularCardRadius = 16.0;

    return Center(
      child: Container(
        height: deviceHeight * deviceHeightRatio,
        width: deviceWidth * deviceWidthRatio,
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius:
                const BorderRadius.all(Radius.circular(circularCardRadius))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardContainer().buildCardHeader(movie, context),
            CardContainer().buildDescriptionContainer(movie, context),
          ],
        ),
      ),
    );
  }
}
