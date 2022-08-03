import 'base_request_param.dart';

class MovieDetailRequestParam extends BaseRequestParam {
  const MovieDetailRequestParam({
    this.movieId = 0,
  });

  final int movieId;
}
