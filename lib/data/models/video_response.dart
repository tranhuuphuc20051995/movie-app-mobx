import 'package:json_annotation/json_annotation.dart';

part 'video_response.g.dart';

@JsonSerializable()
class VideoResponse {
  VideoResponse(this.id, this.videos);

  int id;
  @JsonKey(name: 'results')
  List<Video> videos;

  factory VideoResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResponseToJson(this);
}

@JsonSerializable()
class Video {
  Video(this.iso6391, this.iso31661, this.name, this.key, this.site, this.size,
      this.type, this.official, this.publishedAt, this.id);

  String iso6391;
  String iso31661;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  String publishedAt;
  String id;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
