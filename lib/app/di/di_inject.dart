import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:dio_logger/dio_logger.dart';
import '../../data/api_services/movie_service.dart';
import '../../data/datasources/remote/movie_remote_data_source.dart';
import '../../data/repository/movie_repository_impl.dart';
import '../../domain/repository/movie_repository.dart';
import '../../domain/usecase/movie/get_movie_detail_use_case.dart';
import '../../domain/usecase/movie/get_movie_top_rated_use_case.dart';
import '../../domain/usecase/movie/get_movie_videos_use_case.dart';

GetIt locator = GetIt.instance;

Future<void> initDI() async {
  final dio = Dio();
  dio.interceptors.add(dioLoggerInterceptor);

  locator
    ..registerLazySingleton<Dio>(() => dio)
    ..registerLazySingleton<MovieClientService>(
        () => MovieClientService(locator()))
    ..registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(locator()))
    ..registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(locator()))
    ..registerLazySingleton<GetMovieDetailUseCase>(
        () => GetMovieDetailUseCase(locator()))
    ..registerLazySingleton<GetMovieTopRatedUseCase>(
        () => GetMovieTopRatedUseCase(locator()))
    ..registerLazySingleton<GetMovieVideosUseCase>(
        () => GetMovieVideosUseCase(locator()));
}
