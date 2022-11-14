import 'package:flutter/material.dart';

class DisplayTrendingMovieListHorizontally extends StatelessWidget {
  final List trending;
  final String message = 'Loading';

  const DisplayTrendingMovieListHorizontally(
      {super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
              itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  child: SizedBox(
                    height: 275,
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                              scale: 0.1,
                              'https://image.tmdb.org/t/p/w500${trending[index]['poster_path']}',
                            )),
                          ),
                        ),
                        Text(
                          trending[index]['title'] ?? message,
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
        ),
      ],
    );
  }
}

class DisplayPopularMovieListHorizontally extends StatelessWidget {
  final List popular;
  final String message = 'Loading';

  const DisplayPopularMovieListHorizontally({super.key, required this.popular});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
              itemCount: popular.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  child: SizedBox(
                    height: 275,
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                              scale: 0.1,
                              'https://image.tmdb.org/t/p/w500${popular[index]['poster_path']}',
                            )),
                          ),
                        ),
                        Text(
                          popular[index]['title'] ?? message,
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
        ),
      ],
    );
  }
}