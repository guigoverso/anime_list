import 'package:anime_list/screens/top/widgets/top_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:anime_list/screens/search/search_store.dart';

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
          if (_store.controller.text.isNotEmpty &&
              _store.searchResult.isEmpty) {
            return Expanded(
              child: Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red))),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: _store.searchResult.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: TopCard(
                        anime: _store.searchResult[index],
                        cardIndex: index,
                      ),
                    );
                  }
                  return TopCard(
                    anime: _store.searchResult[index],
                    cardIndex: index,
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
