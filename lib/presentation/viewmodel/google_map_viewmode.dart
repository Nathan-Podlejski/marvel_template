import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marvel_app/data/dto/response_dto.dart';
import 'package:marvel_app/data/model/character.dart';
import 'package:marvel_app/infrastructure/injections/injector.dart';
import 'package:marvel_app/infrastructure/services/connectivity_service.dart';
import 'package:provider/provider.dart';

class GoogleMapViewModel extends ChangeNotifier {
  final ConnectivityServive _connectivityServive;

  CharacterDataContainer data = CharacterDataContainer(offset: 0, count: 0);

  GoogleMapViewModel(this._connectivityServive);

  final List<LatLng> listCoord = List.of(
    [
      const LatLng(48.8449242866406, 2.3287813735097584),
      const LatLng(45.68337955610237, 4.873475387256669),
      const LatLng(40.482414469841125, -3.7385449192642795),
      const LatLng(36.524710745961386, -4.858938731232659),
      const LatLng(41.84868372159075, 12.448363784303137),
      const LatLng(40.84302089678962, 14.312774649003579),
      const LatLng(38.63739301230034, -90.28332348198575),
      const LatLng(36.21887574954319, -115.05691452472864),
      const LatLng(46.80943714620126, -71.25621316333931),
      const LatLng(52.258591270129806, -113.7579447601146),
    ],
  );

  late Box<dynamic> favoriteBox;
  final List<Character> lstCharacter = <Character>[];

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

  static ChangeNotifierProvider<GoogleMapViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child,
      required int id}) {
    return ChangeNotifierProvider<GoogleMapViewModel>(
      create: (BuildContext context) => GoogleMapViewModel(
        injector<ConnectivityServive>(),
      ),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  LatLng getRandomCoord() {
    var rand = Random();
    var id = rand.nextInt(listCoord.length);

    return listCoord[id];
  }
}
