import 'package:mobx/mobx.dart';
import 'package:movie_app/domain/usecase/movie/get_movie_top_rated_use_case.dart';

import '../../data/models/movie_top_rated_response.dart';
import '../../domain/model/request_params/base_request_param.dart';

part 'home_page_controller.g.dart';

class HomePageController = _HomePageController with _$HomePageController;

abstract class _HomePageController with Store {
  _HomePageController(this.getMovieTopRatedUseCase);

  GetMovieTopRatedUseCase getMovieTopRatedUseCase;

  @observable
  ObservableList<Movie> movies = ObservableList.of([]);

  @action
  void fetchMoviesTopRate() {
    getMovieTopRatedUseCase.call(params: const BaseRequestParam()).then(
      (value) {
        if (value.movies?.isNotEmpty == true) {
          movies.addAll(value.movies!);
        }
      },
    );
  }
}
