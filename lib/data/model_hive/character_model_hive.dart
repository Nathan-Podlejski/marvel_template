import 'package:hive/hive.dart';
import 'package:marvel_app/data/model/character.dart';

part 'character_model_hive.g.dart';

@HiveType(typeId: 0)
class CharacterModelHive {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? resourceURI;
  @HiveField(3)
  final ImageMarvel? thumbnail;
  @HiveField(4)
  final String? description;

  CharacterModelHive(
      {this.id, this.name, this.resourceURI, this.thumbnail, this.description});
}

@HiveType(typeId: 1)
class ImageMarvel {
  @HiveField(0)
  final String? path;
  @HiveField(1)
  final String? extension;

  ImageMarvel({this.path, this.extension});
}

CharacterModelHive charToHive(Character char) {
  return CharacterModelHive(
      id: char.id,
      name: char.name,
      resourceURI: char.resourceURI,
      thumbnail: ImageMarvel(
          path: char.thumbnail?.path, extension: char.thumbnail?.extension),
      description: char.description);
}
