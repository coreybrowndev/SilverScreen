import 'package:final_project_ss_app/movie_constructors/movie.dart';
import 'package:flutter/material.dart';

class VerticalMovieList extends StatelessWidget {
  final List<Movie> listOfMovie;

  const VerticalMovieList({super.key, required this.listOfMovie});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          height: deviceHeight * 0.72,
          child: ListView.builder(
              itemCount: listOfMovie.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  child: SizedBox(
                    height: 275,
                    child: Row(
                      children: [
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                              scale: 0.1,
                              'https://image.tmdb.org/t/p/w500${listOfMovie[index].posterPath}',
                            )),
                          ),
                        ),
                        SizedBox(
                          width: deviceWidth * 0.3,
                          child: Text(
                            listOfMovie[index].movieTitle,
                            softWrap: true,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
