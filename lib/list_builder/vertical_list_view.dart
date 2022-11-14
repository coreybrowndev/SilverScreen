import 'package:final_project_ss_app/components/movie.dart';
import 'package:flutter/material.dart';

class DisplayMovieListVertically extends StatelessWidget {
  final List<Movie> listOfMovie;

  const DisplayMovieListVertically({super.key, required this.listOfMovie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
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
        )
      ],
    );
  }
}
