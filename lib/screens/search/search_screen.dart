import 'package:anime_list/screens/top/widgets/top_card.dart';
import 'file:///C:/Users/guilh/Projects/Flutter/anime_list/lib/shared/card/anime_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:anime_list/screens/search/search_store.dart';

import '../../shared/constants.dart';

class SearchScreen extends StatelessWidget {
  final _store = Modular.get<SearchStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            onSubmitted: (value) => _store.fetchSearchResult(),
            controller: _store.controller,
            decoration: InputDecoration(
                labelText: 'Search anime', labelStyle: TextStyle(fontSize: 20)),
          ),
        ),
        Observer(builder: (_) {
          if(_store.searchStatus == Status.error) {
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
          if (_store.searchStatus == Status.waiting) {
            return Expanded(
              child: Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red))),
            );
          }
          if(_store.searchStatus == Status.success){
            return Expanded(
              child: ListView.builder(
                itemCount: _store.searchResult.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: AnimeCard(
                        anime: _store.searchResult[index]
                      ),
                    );
                  }
                  return AnimeCard(
                    anime: _store.searchResult[index]
                  );
                },
              ),
            );
          }

          return Container();
        })
      ],
    );
  }
}
