import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marvel_app/data/model/character.dart';
import 'package:marvel_app/presentation/viewmodel/google_map_viewmode.dart';
import 'package:provider/provider.dart';

class MapSample extends StatefulWidget {
  MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GoogleMapViewModel>();
    return Scaffold(
      body: FutureBuilder(
        future: viewModel.initBox(),
        builder: (_, __) => GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: createAllMarker(viewModel),
        ),
      ),
    );
  }

  Set<Marker> createAllMarker(GoogleMapViewModel viewModel) {
    Set<Marker> lst = {};
    viewModel.lstCharacter.forEach((element) {
      lst.add(createMarker(viewModel, element));
    });
    return lst;
  }

  Marker createMarker(GoogleMapViewModel viewModel, Character char) {
    final MarkerId markerId = MarkerId(char.id.toString());

    final Marker marker = Marker(
      markerId: markerId,
      position: viewModel.getRandomCoord(),
      infoWindow: InfoWindow(title: char.id.toString(), snippet: '*'),
    );

    return marker;
  }
}
