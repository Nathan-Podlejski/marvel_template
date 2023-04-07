// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comic _$ComicFromJson(Map<String, dynamic> json) => Comic(
      id: json['id'] as int?,
      title: json['title'] as String?,
      resourceURI: json['resourceURI'] as String?,
      thumbnail: json['thumbnail'] == null
          ? null
          : ImageMarvel.fromJson(json['thumbnail'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ComicToJson(Comic instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'resourceURI': instance.resourceURI,
      'thumbnail': instance.thumbnail?.toJson(),
      'description': instance.description,
    };

ImageMarvel _$ImageMarvelFromJson(Map<String, dynamic> json) => ImageMarvel(
      path: json['path'] as String?,
      extension: json['extension'] as String?,
    );

Map<String, dynamic> _$ImageMarvelToJson(ImageMarvel instance) =>
    <String, dynamic>{
      'path': instance.path,
      'extension': instance.extension,
    };
