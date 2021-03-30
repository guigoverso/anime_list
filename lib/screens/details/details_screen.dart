import 'package:anime_list/screens/details/widgets/detail_page.dart';
import 'package:anime_list/shared/constants.dart';
import 'package:anime_list/shared/error_view.dart';
import 'package:anime_list/shared/waiting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'details_store.dart';

class DetailsScreen extends StatelessWidget {
  final _store = Modular.get<DetailsStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(_store.title),
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_outline),
          onPressed: () {},
        ),
      ],
    ),
    body: Observer(
      builder: (_) {
        switch (_store.dataStatus) {
          case Status.success:
            return DetailPage(anime: _store.anime);
          case Status.error:
            return ErrorView();
          case Status.waiting:
            return WaitingView();
          default:
            return WaitingView();
        }
      },
    ),
  );
}
