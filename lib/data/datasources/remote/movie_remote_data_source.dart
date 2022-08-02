import 'package:movie_app/data/models/movie_top_rated_response.dart';
import 'package:movie_app/data/models/video_response.dart';

import '../../models/movie_detail_response.dart';
import '../../api_services/movie_service.dart';

abstract class MovieRemoteDataSource {
  Future<MovieDetailResponse> getMovieDetail(int id);

  Future<VideoResponse> getVideosOfMovie(int id);

  Future<MovieTopRatedResponse> getTopRated();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  MovieRemoteDataSourceImpl(this.movieClientService);

  MovieClientService movieClientService;

  @override
  Future<MovieTopRatedResponse> getTopRated() {
    return movieClientService.getTopRated();
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) {
    return movieClientService.getMovieDetail(id);
  }

  @override
  Future<VideoResponse> getVideosOfMovie(int id) {
    return movieClientService.getVideosOfMovie(id);
  }
}
