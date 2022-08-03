import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_top_rated_response.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    required Movie movie,
    required Function onMovieTap,
    Key? key,
  })  : _movie = movie,
        _onMovieTap = onMovieTap,
        super(key: key);

  final Movie _movie;
  final Function _onMovieTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onMovieTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500${_movie.posterPath}',
            height: 200,
          ),
          const SizedBox(height: 8),
          Text(
            _movie.title ?? '',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
