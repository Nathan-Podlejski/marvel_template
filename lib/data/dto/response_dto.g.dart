// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseChar _$ResponseCharFromJson(Map<String, dynamic> json) => ResponseChar(
      data:
          CharacterDataContainer.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseCharToJson(ResponseChar instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

CharacterDataContainer _$CharacterDataContainerFromJson(
        Map<String, dynamic> json) =>
    CharacterDataContainer(
      offset: json['offset'] as int,
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterDataContainerToJson(
        CharacterDataContainer instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'count': instance.count,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

ResponseCharComic _$ResponseCharComicFromJson(Map<String, dynamic> json) =>
    ResponseCharComic(
      data: CharacterComicDataContainer.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseCharComicToJson(ResponseCharComic instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

CharacterComicDataContainer _$CharacterComicDataContainerFromJson(
        Map<String, dynamic> json) =>
    CharacterComicDataContainer(
      offset: json['offset'] as int,
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Comic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterComicDataContainerToJson(
        CharacterComicDataContainer instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'count': instance.count,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };
