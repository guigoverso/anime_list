import 'package:anime_list/screens/top/top_store.dart';
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
        padding: EdgeInsets.all(16.0),
        itemCount: _store.topAnimes.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Text('$index', style: TextStyle(color: Colors.red),),
              Column(
                children: [
                  Text(_store.topAnimes[index].title),
                  Text('Nota: ${_store.topAnimes[index].score}')
                ],
              )
            ],
          );
        },
      ) : Center(child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red)
      )),
    );
  }
}
