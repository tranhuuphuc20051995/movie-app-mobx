import 'package:mobx/mobx.dart';
import '../../data/models/movie_detail_response.dart';
import '../../data/models/video_response.dart';
import '../../domain/usecase/movie/get_movie_detail_use_case.dart';
import '../../domain/usecase/movie/get_movie_videos_use_case.dart';
import '../../domain/model/request_params/movie_request_param.dart';

part 'movie_detail_page_controller.g.dart';

class MovieDetailPageController = _MovieDetailPageController
    with _$MovieDetailPageController;

abstract class _MovieDetailPageController with Store {
  _MovieDetailPageController(
    this.getMovieDetailUseCase,
    this.getMovieVideosUseCase,
  );

  GetMovieDetailUseCase getMovieDetailUseCase;
  GetMovieVideosUseCase getMovieVideosUseCase;

  @observable
  MovieDetailResponse? movieDetail;

  @observable
  VideoResponse? videos;

  @action
  void fetchMovieDetail(int movieId) {
    getMovieDetailUseCase
        .call(params: MovieDetailRequestParam(movieId: movieId))
        .then(
      (value) {
        movieDetail = value;
      },
    );
  }

  @action
  Future<void> onPlayTrailer(int movieId) async {
    await getMovieVideosUseCase
        .call(params: MovieDetailRequestParam(movieId: movieId))
        .then(
      (value) {
        videos = value;
      },
    );
  }
}
