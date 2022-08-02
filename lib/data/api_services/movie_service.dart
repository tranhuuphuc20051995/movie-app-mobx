import 'package:dio/dio.dart';
import 'package:movie_app/app/constants/app_apis.dart';
import 'package:retrofit/retrofit.dart';

import '../models/movie_detail_response.dart';
import '../models/movie_top_rated_response.dart';
import '../models/video_response.dart';

part 'movie_service.g.dart';

@RestApi(baseUrl: AppApi.baseUrl)
abstract class MovieClientService {
  factory MovieClientService(Dio dio) = _MovieClientService;

  @GET('top_rated')
  Future<MovieTopRatedResponse> getTopRated();

  @GET('movie/{id}')
  Future<MovieDetailResponse> getMovieDetail(@Path("id") int id);

  @GET('movie/{id}/videos')
  Future<VideoResponse> getVideosOfMovie(@Path("id") int id);
}
