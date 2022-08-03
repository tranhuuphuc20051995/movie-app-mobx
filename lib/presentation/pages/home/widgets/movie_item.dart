import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/data/models/movie_top_rated_response.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    required Movie movie,
    Key? key,
  })  : _movie = movie,
        super(key: key);

  final Movie _movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${_movie.backdropPath}',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Text(_movie.title),
      ],
    );
  }
}
