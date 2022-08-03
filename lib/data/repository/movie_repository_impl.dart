import 'package:movie_app/data/models/movie_detail_response.dart';

import 'package:movie_app/data/models/movie_top_rated_response.dart';

import 'package:movie_app/data/models/video_response.dart';

import '../../domain/model/request_params/base_request_param.dart';
import '../../domain/model/request_params/movie_request_param.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasources/remote/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this.movieRemoteDataSource);

  MovieRemoteDataSource movieRemoteDataSource;

  @override
  Future<MovieDetailResponse> getMovieDetail(MovieDetailRequestParam params) {
    return movieRemoteDataSource.getMovieDetail(params);
  }

  @override
  Future<MovieTopRatedResponse> getTopRated(BaseRequestParam params) {
    return movieRemoteDataSource.getTopRated(params);
  }

  @override
  Future<VideoResponse> getVideosOfMovie(MovieDetailRequestParam params) {
    return movieRemoteDataSource.getVideosOfMovie(params);
  }
}
