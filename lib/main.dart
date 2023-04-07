import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marvel_app/data/model_hive/character_model_hive.dart';
import 'package:marvel_app/presentation/navigation/bottom_nav_bar.dart';
import 'infrastructure/injections/injector.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CharacterModelHiveAdapter());
  Hive.registerAdapter(ImageMarvelAdapter());
  final GetIt getIt = initializeInjections();
  await getIt.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel app',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavBar(),
    );
  }
}
