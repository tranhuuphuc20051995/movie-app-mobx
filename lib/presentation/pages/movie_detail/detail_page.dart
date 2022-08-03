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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://image.tmdb.org/t/p/w500${_movieDetailPageController.movieDetail?.posterPath}',
                loadingBuilder: (
                  context,
                  child,
                  loadingProgress,
                ) =>
                    const CircularProgressIndicator(),
                errorBuilder: (context, url, error) => const Icon(Icons.error),
              ),
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
                  await _movieDetailPageController.onPlayTrailer(args.movieId);
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
        },
      ),
    );
  }
}
