import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marvel_app/data/model/character.dart';
import 'package:marvel_app/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'detail_character_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des personnages"),
      ),
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      body: FutureBuilder(
        future: viewModel.initBox(),
        builder: (_, __) => ListView.separated(
            shrinkWrap: true,
            controller: viewModel.scrollController,
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
    );
  }
}
