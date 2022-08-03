import 'package:movie_app/data/models/movie_top_rated_response.dart';
import 'package:movie_app/data/models/video_response.dart';

import '../../../domain/model/request_params/base_request_param.dart';
import '../../../domain/model/request_params/movie_request_param.dart';
import '../../models/movie_detail_response.dart';
import '../../api_services/movie_service.dart';

abstract class MovieRemoteDataSource {
  Future<MovieDetailResponse> getMovieDetail(MovieDetailRequestParam params);

  Future<VideoResponse> getVideosOfMovie(MovieDetailRequestParam params);

  Future<MovieTopRatedResponse> getTopRated(BaseRequestParam params);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  MovieRemoteDataSourceImpl(this.movieClientService);

  MovieClientService movieClientService;

  @override
  Future<MovieTopRatedResponse> getTopRated(BaseRequestParam params) {
    return movieClientService.getTopRated(
      params.apiKey,
      params.language,
    );
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(MovieDetailRequestParam params) {
    return movieClientService.getMovieDetail(
      params.apiKey,
      params.language,
      params.movieId,
    );
  }

  @override
  Future<VideoResponse> getVideosOfMovie(MovieDetailRequestParam params) {
    return movieClientService.getVideosOfMovie(
      params.apiKey,
      params.language,
      params.movieId,
    );
  }
}
