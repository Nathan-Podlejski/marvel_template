import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_app/data/model/character.dart';

import '../model/comic.dart';

part 'response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseChar {
  CharacterDataContainer data;

  ResponseChar({
    required this.data,
  });

  factory ResponseChar.fromJson(Map<String, dynamic> json) =>
      _$ResponseCharFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseCharToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CharacterDataContainer {
  int offset;
  int count;
  List<Character>? results;

  CharacterDataContainer(
      {required this.offset, required this.count, this.results});

  factory CharacterDataContainer.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataContainerFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDataContainerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResponseCharComic {
  CharacterComicDataContainer data;

  ResponseCharComic({
    required this.data,
  });

  factory ResponseCharComic.fromJson(Map<String, dynamic> json) =>
      _$ResponseCharComicFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseCharComicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CharacterComicDataContainer {
  int offset;
  int count;
  List<Comic>? results;

  CharacterComicDataContainer(
      {required this.offset, required this.count, this.results});

  factory CharacterComicDataContainer.fromJson(Map<String, dynamic> json) =>
      _$CharacterComicDataContainerFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterComicDataContainerToJson(this);
}
