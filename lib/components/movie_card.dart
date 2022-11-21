import 'package:flutter/material.dart';
import 'package:final_project_ss_app/components/movie.dart';
import 'package:final_project_ss_app/components/movie_card_containers.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  static const deviceHeightRatio = 0.6;
  static const deviceWidthRatio = 0.85;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        height: deviceHeight * deviceHeightRatio,
        width: deviceWidth * deviceWidthRatio,
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
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
