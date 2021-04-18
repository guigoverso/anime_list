import 'package:anime_list/database/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'favorites_store.dart';
import 'widgets/favorite_card.dart';

class FavoritesScreen extends StatelessWidget {
  final _store = Modular.get<FavoritesStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView.builder(
        itemCount: _store.favorites.length,
        itemBuilder: (_, index) {
          final anime = _store.favorites[index];
          return FavoriteCard(
            anime: anime,
            store: _store,
          );
        },
      ),
    );
  }
}
