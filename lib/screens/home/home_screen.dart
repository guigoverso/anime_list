import 'package:anime_list/services/anime_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {

  final _store = Modular.get<AnimeService>();

  @override
  Widget build(BuildContext context) {
    _store.searchAnime();
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime List'),
      ),
      body: Center(
        child: Text('Anime List'),
      ),
    );
  }
}
