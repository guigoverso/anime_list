import 'package:anime_list/models/anime_model.dart';
import 'package:anime_list/screens/top/top_store.dart';
import 'package:anime_list/screens/top/widgets/top_card.dart';
import 'package:anime_list/services/anime_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TopScreen extends StatelessWidget {

  final _store = Modular.get<TopStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => _store.isDataDownloaded ?  ListView.builder(
        itemCount: _store.topAnimes.length,
        itemBuilder: (context, index) {
          return TopCard(anime: _store.topAnimes[index], cardIndex: index);
        },
      ) : Center(child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red)
      )),
    );
  }
}
