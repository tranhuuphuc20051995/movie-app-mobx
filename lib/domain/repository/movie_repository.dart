import '../../data/models/movie_detail_response.dart';
import '../../data/models/movie_top_rated_response.dart';
import '../../data/models/video_response.dart';
import '../model/request_params/base_request_param.dart';
import '../model/request_params/movie_request_param.dart';

abstract class MovieRepository {
  Future<MovieDetailResponse> getMovieDetail(MovieDetailRequestParam params);

  Future<VideoResponse> getVideosOfMovie(MovieDetailRequestParam params);

  Future<MovieTopRatedResponse> getTopRated(BaseRequestParam params);
}
