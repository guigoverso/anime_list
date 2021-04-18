import 'package:anime_list/models/anime_model.dart';
import 'package:anime_list/screens/top/top_store.dart';
import 'package:anime_list/screens/top/widgets/top_card.dart';
import 'package:anime_list/services/anime_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants.dart';

class TopScreen extends StatelessWidget {
  final _store = Modular.get<TopStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (_store.dataStatus == Status.error) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 80,
            ),
            SizedBox(height: 20,),
            Text('Não foi possível carregar os dados', textAlign: TextAlign.center, style: TextStyle(fontSize: 18),)
          ],
        );
      }
      if (_store.dataStatus == Status.success) {
        return ListView.builder(
            itemCount: _store.topAnimes.length,
            itemBuilder: (context, index) {
              return TopCard(anime: _store.topAnimes[index], cardIndex: index);
            });
      }
      return Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red)));
    });
  }
}
