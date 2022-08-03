import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../app/di/di_inject.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/routes/arguments/movie_arguments.dart';
import '../../../domain/usecase/movie/get_movie_top_rated_use_case.dart';
import '../../controllers/home_page_controller.dart';
import 'widgets/movie_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomePageController _homePageViewModel =
      HomePageController(locator<GetMovieTopRatedUseCase>());

  @override
  Widget build(BuildContext context) {
    _homePageViewModel.fetchMoviesTopRate();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Filter min/max year',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            child: const Text('Close BottomSheet'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Icon(
                Icons.filter_alt_rounded,
                size: 24,
              ),
            ),
          )
        ],
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (_homePageViewModel.movies.isNotEmpty) {
            return GridView.builder(
              itemCount: _homePageViewModel.movies.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = _homePageViewModel.movies[index];
                return MovieItem(
                  movie: movie,
                  onMovieTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoute.movieDetailPage,
                      arguments: MovieArguments(
                        movieId: movie.id ?? 0,
                        backdropImage: movie.backdropPath ?? '',
                      ),
                    );
                  },
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
