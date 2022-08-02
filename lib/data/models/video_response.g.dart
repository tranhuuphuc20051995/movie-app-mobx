// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResponse _$VideoResponseFromJson(Map<String, dynamic> json) =>
    VideoResponse(
      json['id'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoResponseToJson(VideoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.videos,
    };

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      json['iso6391'] as String,
      json['iso31661'] as String,
      json['name'] as String,
      json['key'] as String,
      json['site'] as String,
      json['size'] as int,
      json['type'] as String,
      json['official'] as bool,
      json['publishedAt'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'iso6391': instance.iso6391,
      'iso31661': instance.iso31661,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'publishedAt': instance.publishedAt,
      'id': instance.id,
    };
