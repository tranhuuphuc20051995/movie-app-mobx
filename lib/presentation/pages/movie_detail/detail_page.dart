import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/routes/arguments/movie_arguments.dart';
import '../../../app/di/di_inject.dart';
import '../../../app/routes/arguments/trailer_arguments.dart';
import '../../../presentation/controllers/movie_detail_page_controller.dart';
import '../../../domain/usecase/movie/get_movie_detail_use_case.dart';
import '../../../domain/usecase/movie/get_movie_videos_use_case.dart';

class MovieDetailPage extends StatelessWidget {
  MovieDetailPage({Key? key}) : super(key: key);

  final MovieDetailPageController _movieDetailPageController =
      MovieDetailPageController(
          locator<GetMovieDetailUseCase>(), locator<GetMovieVideosUseCase>());

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MovieArguments;
    _movieDetailPageController.fetchMovieDetail(args.movieId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail Page'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (_movieDetailPageController.movieDetail != null) {
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${args.backdropImage}',
                    fit: BoxFit.fitWidth,
                    placeholder: (
                      BuildContext context,
                      String url,
                    ) =>
                        const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _movieDetailPageController.movieDetail?.title ?? '',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  _movieDetailPageController.movieDetail?.releaseDate ?? '',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  _movieDetailPageController.movieDetail?.overview ?? '',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () async {
                    await _movieDetailPageController
                        .onPlayTrailer(args.movieId);
                    if (_movieDetailPageController.videos?.videos?.isEmpty ==
                        true) {
                      return;
                    }
                    final List<String> trailerLinks = [];
                    _movieDetailPageController.videos?.videos?.forEach((video) {
                      if (video.key?.isNotEmpty == true) {
                        trailerLinks.add(video.key!);
                      }
                    });
                    Navigator.of(context).pushNamed(
                      AppRoute.movieTrailerPage,
                      arguments: TrailerArguments(trailerLinks: trailerLinks),
                    );
                  },
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 48,
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
