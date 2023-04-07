// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterModelHiveAdapter extends TypeAdapter<CharacterModelHive> {
  @override
  final int typeId = 0;

  @override
  CharacterModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterModelHive(
      id: fields[0] as int?,
      name: fields[1] as String?,
      resourceURI: fields[2] as String?,
      thumbnail: fields[3] as ImageMarvel?,
      description: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CharacterModelHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.resourceURI)
      ..writeByte(3)
      ..write(obj.thumbnail)
      ..writeByte(4)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageMarvelAdapter extends TypeAdapter<ImageMarvel> {
  @override
  final int typeId = 1;

  @override
  ImageMarvel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageMarvel(
      path: fields[0] as String?,
      extension: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageMarvel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.path)
      ..writeByte(1)
      ..write(obj.extension);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageMarvelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
