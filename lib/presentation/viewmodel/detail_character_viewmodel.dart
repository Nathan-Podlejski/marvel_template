import 'package:flutter/widgets.dart';
import 'package:marvel_app/data/dto/response_dto.dart';
import 'package:marvel_app/data/endpoint/characters_endpoint.dart';
import 'package:marvel_app/data/model/character.dart';
import 'package:marvel_app/infrastructure/injections/injector.dart';
import 'package:marvel_app/infrastructure/services/connectivity_service.dart';
import 'package:provider/provider.dart';

import '../../data/model/comic.dart';

class DetailCharacterViewModel extends ChangeNotifier {
  final CharacterEndpoint characterEndpoint;
  final ConnectivityServive _connectivityServive;

  CharacterDataContainer data = CharacterDataContainer(offset: 0, count: 0);

  DetailCharacterViewModel(this._connectivityServive,
      {required this.characterEndpoint});

  static ChangeNotifierProvider<DetailCharacterViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child,
      required int id}) {
    return ChangeNotifierProvider<DetailCharacterViewModel>(
      create: (BuildContext context) => DetailCharacterViewModel(
        injector<ConnectivityServive>(),
        characterEndpoint: injector<CharacterEndpoint>(),
      )..loadComics(id),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  final List<Comic> lstComic = <Comic>[];

  Future<void> loadComics(int id) async {
    var endpointResult = await characterEndpoint.getCharactersStories(id);

    lstComic.clear;
    lstComic.addAll(endpointResult.data.results ?? <Comic>[]);

    notifyListeners();
  }
}
