import '../../../data/models/movie_top_rated_response.dart';
import '../../model/request_params/base_request_param.dart';
import '../../repository/movie_repository.dart';
import '../base_use_case.dart';

class GetMovieTopRatedUseCase
    implements BaseUseCase<MovieTopRatedResponse, BaseRequestParam> {
  GetMovieTopRatedUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<MovieTopRatedResponse> call({required BaseRequestParam params}) =>
      movieRepository.getTopRated(params);
}
