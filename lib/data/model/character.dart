import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_app/data/model_hive/character_model_hive.dart';

part 'character.g.dart';

@JsonSerializable(explicitToJson: true)
class Character {
  int? id;
  String? name;
  String? resourceURI;
  ImageMarvel? thumbnail;
  String? description;

  String get imagePath => "${thumbnail?.path}.${thumbnail?.extension}";

  Character(
      {this.id, this.name, this.resourceURI, this.thumbnail, this.description});

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ImageMarvel {
  String? path;
  String? extension;

  ImageMarvel({this.path, this.extension});

  factory ImageMarvel.fromJson(Map<String, dynamic> json) =>
      _$ImageMarvelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageMarvelToJson(this);
}

Character hiveToChar(CharacterModelHive char) {
  return Character(
      id: char.id,
      name: char.name,
      resourceURI: char.resourceURI,
      thumbnail: ImageMarvel(
          path: char.thumbnail?.path, extension: char.thumbnail?.extension),
      description: char.description);
}
