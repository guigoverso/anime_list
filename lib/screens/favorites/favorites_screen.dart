import 'package:anime_list/database/local_storage.dart';
import 'package:anime_list/models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'favorites_store.dart';

class FavoritesScreen extends StatelessWidget {
  final _store = Modular.get<FavoritesStore>();

  FavoritesScreen() {
    print(_store.favorites);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            child: Text('Adicionar anime'),
            onPressed: () => _store.addFavorite(
              Favorite(
                title: 'Anime de teste ${LocalStorage.qnt}',
                id: LocalStorage.qnt
              ),
            ),
          ),
          ElevatedButton(
              child: Text('Limpar LocalStorage'),
              onPressed: LocalStorage.clear,
          ),
          ElevatedButton(
            child: Text('Imprimir no console'),
            onPressed: () => LocalStorage.imprimir(),
          )
        ],
      ),
    );
  }
}
