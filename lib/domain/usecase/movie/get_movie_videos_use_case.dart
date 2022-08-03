import '../../../data/models/video_response.dart';
import '../../model/request_params/movie_request_param.dart';
import '../../repository/movie_repository.dart';
import '../base_use_case.dart';

class GetMovieVideosUseCase
    implements BaseUseCase<VideoResponse, MovieDetailRequestParam> {
  GetMovieVideosUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<VideoResponse> call({required MovieDetailRequestParam params}) =>
      movieRepository.getVideosOfMovie(params);
}
