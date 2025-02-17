// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as int?,
      name: json['name'] as String?,
      resourceURI: json['resourceURI'] as String?,
    )
      ..thumbnail = json['thumbnail'] == null
          ? null
          : ImageMarvel.fromJson(json['thumbnail'] as Map<String, dynamic>)
      ..description = json['description'] as String?;

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
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
