import 'package:flutter/material.dart';
import 'package:final_project_ss_app/components/movie.dart';

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
        decoration: movieCardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTopHalf(movie, context),
            buildBottomHalf(movie, context),
          ],
        ),
      ),
    );
  }

  //Poster & movie information
  Widget buildTopHalf(movie, context) => Row(
        children: [
          Column(
            children: [
              Container(
                child: displayPoster(movie),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMovieTitle(movie, context),
                displayRating(movie),
              ],
            ),
          ),
        ],
      );

  //Description
  Widget buildBottomHalf(movie, context) => Column(
        children: [
          Text(
            'Description \n',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                movie.movieOverview,
                softWrap: true,
              ),
            ),
          )
        ],
      );

  //Includes the release date of the movie
  Widget buildMovieTitle(Movie movie, context) => Column(
        children: [
          SizedBox(
            child: Text(
              movie.movieTitle,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleLarge,
              softWrap: true,
            ),
          ),
          SizedBox(
            width: 177,
            height: 40,
            child: Text(
              movie.releaseDate,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
              softWrap: true,
            ),
          ),
        ],
      );

  displayPoster(Movie movie) => Container(
        margin: const EdgeInsets.all(10),
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      );

  Widget displayRating(movie) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.star_border),
          Icon(Icons.star_border),
          Icon(Icons.star_border),
          Icon(Icons.star_border),
          Icon(Icons.star_border),
        ],
      );

  movieCardDecoration() => BoxDecoration(
      color: Colors.grey,
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(16)));
}
