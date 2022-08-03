import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../app/di/di_inject.dart';
import '../../controllers/home_page_controller.dart';
import 'widgets/movie_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  HomePageController get _homePageViewModel => locator<HomePageController>();

  @override
  Widget build(BuildContext context) {
    _homePageViewModel.fetchMoviesTopRate();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (_homePageViewModel.movies.isNotEmpty) {
            return ListView.builder(
              itemCount: _homePageViewModel.movies.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieItem(
                  movie: _homePageViewModel.movies[index],
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
