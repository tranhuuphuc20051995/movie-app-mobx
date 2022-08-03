import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../app/constants/app_apis.dart';
import '../models/movie_detail_response.dart';
import '../models/movie_top_rated_response.dart';
import '../models/video_response.dart';

part 'movie_service.g.dart';

@RestApi(baseUrl: AppApi.baseUrl)
abstract class MovieClientService {
  factory MovieClientService(Dio dio) = _MovieClientService;

  @GET('movie/top_rated')
  Future<MovieTopRatedResponse> getTopRated(
    @Query("api_key") String apiKey,
    @Query("language") String language,
  );

  @GET('movie/{id}')
  Future<MovieDetailResponse> getMovieDetail(
    @Query("api_key") String apiKey,
    @Query("language") String language,
    @Path("id") int id,
  );

  @GET('movie/{id}/videos')
  Future<VideoResponse> getVideosOfMovie(
    @Query("api_key") String apiKey,
    @Query("language") String language,
    @Path("id") int id,
  );
}
