import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:marvel_app/data/dto/response_dto.dart';
import 'package:marvel_app/data/endpoint/characters_endpoint.dart';
import 'package:marvel_app/data/model/character.dart';
import 'package:marvel_app/infrastructure/services/connectivity_service.dart';

import '../../data/model/comic.dart';
import '../../data/model_hive/character_model_hive.dart';

class HomeViewModel extends ChangeNotifier {
  final CharacterEndpoint characterEndpoint;
  final ConnectivityServive _connectivityServive;

  CharacterDataContainer data = CharacterDataContainer(offset: 0, count: 0);
  late Box<dynamic> favoriteBox;

  HomeViewModel(this._connectivityServive, {required this.characterEndpoint}) {
    load(0);
    initScroll();
  }

  final List<Character> lstCharacter = <Character>[];
  final List<Comic> lstComic = <Comic>[];

  final ScrollController scrollController = ScrollController();
  int _currentPage = 0;

  void initScroll() {
    scrollController.addListener(() {
      if (scrollController.offset >=
          (scrollController.position.maxScrollExtent * 0.9)) {
        _currentPage++;
        load(_currentPage * 20);
      }
    });
  }

  Future<void> initBox() async {
    favoriteBox = await Hive.openBox('favorites');
  }

  Future<void> load(int offset) async {
    try {
      var endpointResult =
          await characterEndpoint.getCharacters(offset.toString());

      lstCharacter.addAll(endpointResult.data.results ?? <Character>[]);

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loadComics(int id) async {
    var endpointResult = await characterEndpoint.getCharactersStories(id);

    lstComic.clear;
    lstComic.addAll(endpointResult.data.results ?? <Comic>[]);

    notifyListeners();
  }

  void toogleFavorite(Character char) {
    if (isFavorite(char)) {
      favoriteBox.delete(char.name);
      print("favorite deleted");
    } else {
      var data = charToHive(char);
      favoriteBox.put(char.name, data);
      print("favorite added");
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
