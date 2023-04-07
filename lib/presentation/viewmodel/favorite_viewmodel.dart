import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:marvel_app/data/dto/response_dto.dart';
import 'package:marvel_app/data/model/character.dart';
import 'package:marvel_app/infrastructure/services/connectivity_service.dart';

import '../../data/model/comic.dart';
import '../../data/model_hive/character_model_hive.dart';

class FavoriteViewModel extends ChangeNotifier {
  final ConnectivityServive _connectivityServive;

  CharacterDataContainer data = CharacterDataContainer(offset: 0, count: 0);
  late Box<dynamic> favoriteBox;

  FavoriteViewModel(this._connectivityServive) {}

  final List<Character> lstCharacter = <Character>[];
  final List<Comic> lstComic = <Comic>[];

  Future<void> initBox() async {
    favoriteBox = Hive.box('favorites');
    loadAllChars();
  }

  void loadAllChars() async {
    lstCharacter.clear();
    var mapBox = favoriteBox.toMap();

    mapBox.forEach((key, value) {
      lstCharacter.add(hiveToChar(value));
    });
  }

  void toogleFavorite(Character char) {
    if (isFavorite(char)) {
      favoriteBox.delete(char.name);
    } else {
      var data = charToHive(char);
      favoriteBox.put(char.name, data);
    }
    notifyListeners();
  }

  bool isFavorite(Character char) {
    var test = favoriteBox.get(char.name);

    if (test == null) {
      return false;
    }

    return true;
  }
}
