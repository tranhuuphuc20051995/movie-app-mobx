import 'package:json_annotation/json_annotation.dart';

part 'movie_top_rated_response.g.dart';

@JsonSerializable()
class MovieTopRatedResponse {
  int page;
  @JsonKey(name: 'results')
  List<Movie> movies;
  int totalPages;
  int totalResults;

  MovieTopRatedResponse(
      this.page, this.movies, this.totalPages, this.totalResults);

  factory MovieTopRatedResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieTopRatedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieTopRatedResponseToJson(this);
}

@JsonSerializable()
class Movie {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Movie(
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
