import '../../../data/models/movie_detail_response.dart';
import '../../../domain/repository/movie_repository.dart';
import '../../model/request_params/movie_request_param.dart';
import '../base_use_case.dart';

class GetMovieDetailUseCase
    implements BaseUseCase<MovieDetailResponse, MovieDetailRequestParam> {
  GetMovieDetailUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<MovieDetailResponse> call({required MovieDetailRequestParam params}) =>
      movieRepository.getMovieDetail(params);
}
