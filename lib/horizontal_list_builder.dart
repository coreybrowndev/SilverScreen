import 'dart:io';
import 'package:final_project_ss_app/components/movie.dart';
import 'package:flutter/material.dart';

class DisplayMovieListHorizontally extends StatelessWidget {
  final List<Movie> listOfMovie;

  const DisplayMovieListHorizontally(
      {required Key key, required this.listOfMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
          itemCount: listOfMovie.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              child: SizedBox(
                child: Column(
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
                    Text(
                      listOfMovie[index].movieTitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
