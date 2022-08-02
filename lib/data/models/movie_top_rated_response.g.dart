// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_top_rated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieTopRatedResponse _$MovieTopRatedResponseFromJson(
        Map<String, dynamic> json) =>
    MovieTopRatedResponse(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalPages'] as int,
      json['totalResults'] as int,
    );

Map<String, dynamic> _$MovieTopRatedResponseToJson(
        MovieTopRatedResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      json['adult'] as bool,
      json['backdropPath'] as String,
      (json['genreIds'] as List<dynamic>).map((e) => e as int).toList(),
      json['id'] as int,
      json['originalLanguage'] as String,
      json['originalTitle'] as String,
      json['overview'] as String,
      (json['popularity'] as num).toDouble(),
      json['posterPath'] as String,
      json['releaseDate'] as String,
      json['title'] as String,
      json['video'] as bool,
      (json['voteAverage'] as num).toDouble(),
      json['voteCount'] as int,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'genreIds': instance.genreIds,
      'id': instance.id,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
