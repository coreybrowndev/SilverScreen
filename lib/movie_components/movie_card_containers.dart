import 'package:flutter/material.dart';

class CardContainer {
  Widget buildCardHeader(movie, context) => Row(
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

  Widget buildDescriptionContainer(movie, context) => Column(
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
  Widget buildMovieTitle(movie, context) => Column(
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

  displayPoster(movie) => Container(
        margin: const EdgeInsets.all(10),
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: NetworkImage(movie.posterPath),
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
}