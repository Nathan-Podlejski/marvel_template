import 'package:flutter/material.dart';
import 'package:marvel_app/data/endpoint/characters_endpoint.dart';
import 'package:marvel_app/infrastructure/injections/injector.dart';
import 'package:marvel_app/infrastructure/services/connectivity_service.dart';
import 'package:marvel_app/presentation/screen/favorite_screen.dart';
import 'package:marvel_app/presentation/screen/home_screen.dart';
import 'package:marvel_app/presentation/viewmodel/favorite_viewmodel.dart';
import 'package:marvel_app/presentation/viewmodel/google_map_viewmode.dart';
import 'package:marvel_app/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

import '../screen/google_map_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    MapSample(),
    const FavoriteScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(
            injector<ConnectivityServive>(),
            characterEndpoint: injector<CharacterEndpoint>(),
          ),
        ),
        ChangeNotifierProvider<FavoriteViewModel>(
            create: (_) => FavoriteViewModel(injector<ConnectivityServive>())),
        ChangeNotifierProvider<GoogleMapViewModel>(
            create: (_) => GoogleMapViewModel(injector<ConnectivityServive>())),
      ],
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Comics',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Carte',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoris',
              backgroundColor: Colors.purple,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
