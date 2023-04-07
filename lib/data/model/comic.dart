import 'package:json_annotation/json_annotation.dart';

part 'comic.g.dart';

@JsonSerializable(explicitToJson: true)
class Comic {
  int? id;
  String? title;
  String? resourceURI;
  ImageMarvel? thumbnail;
  String? description;

  String get imagePath => "${thumbnail?.path}.${thumbnail?.extension}";

  Comic(
      {this.id,
      this.title,
      this.resourceURI,
      this.thumbnail,
      this.description});

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

  Map<String, dynamic> toJson() => _$ComicToJson(this);
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
