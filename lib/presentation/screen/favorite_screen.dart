import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marvel_app/data/model/character.dart';
import 'package:marvel_app/presentation/viewmodel/favorite_viewmodel.dart';
import 'package:marvel_app/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'detail_character_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavoriteViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des favoris"),
      ),
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      body: FutureBuilder(
        future: viewModel.initBox(),
        builder: (_, __) => SingleChildScrollView(
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: viewModel.lstCharacter.length,
              itemBuilder: (context, index) {
                Character char = viewModel.lstCharacter[index];
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 4),
                      color: Color.fromARGB(255, 13, 34, 82)),
                  child: ListTile(
                    leading: SizedBox(
                        height: 100,
                        width: 80,
                        child: Image.network(
                          char.imagePath,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(),
                        )),
                    title: Text(char.name.toString(),
                        style: const TextStyle(color: Colors.white)),
                    trailing: IconButton(
                      onPressed: () {
                        viewModel.toogleFavorite(char);
                      },
                      icon: ValueListenableBuilder(
                        valueListenable:
                            ValueNotifier(Hive.box('favorites').listenable()),
                        builder: (context, box, widget) {
                          return box.value.get(char.name) != null
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border);
                        },
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailCharacter(character: char)),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: 2,
                  )),
        ),
      ),
    );
  }
}
