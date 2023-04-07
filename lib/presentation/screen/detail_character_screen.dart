import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel_app/data/endpoint/characters_endpoint.dart';
import 'package:marvel_app/data/model/character.dart';
import 'package:marvel_app/data/model/comic.dart';
import 'package:marvel_app/infrastructure/services/connectivity_service.dart';
import 'package:marvel_app/presentation/viewmodel/detail_character_viewmodel.dart';
import 'package:marvel_app/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class DetailCharacter extends StatelessWidget {
  const DetailCharacter({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return DetailCharacterViewModel.buildWithProvider(
        id: character.id ?? 0,
        builder: (context, child) {
          final viewmodel = context.watch<DetailCharacterViewModel>();
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Text(character.name ?? ""),
                    Image.network(
                      character.imagePath,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(),
                    ),
                    Text(character.description ?? ""),
                    ExpansionTile(
                      title: Text("Comics"),
                      children: _buildExpandableContent(viewmodel),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  _buildExpandableContent(DetailCharacterViewModel viewModel) {
    List<Widget> columnContent = [];

    for (Comic content in viewModel.lstComic) {
      columnContent.add(
        ListTile(
          title: Text(
            content.title ?? "",
            style: const TextStyle(fontSize: 18.0),
          ),
          leading: SizedBox(
            height: 100,
            width: 100,
            child: Image.network(
              content.imagePath,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => const Center(),
            ),
          ),
        ),
      );
    }

    return columnContent;
  }
}
