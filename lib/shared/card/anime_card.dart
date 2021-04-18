import 'package:anime_list/database/local_storage.dart';
import 'package:anime_list/models/anime_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'anime_card_store.dart';

class AnimeCard extends StatelessWidget {
  AnimeCardStore _store;

  AnimeCard({Key key, @required store}) : super(key: key) {
    this._store = store;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed(
        '/details',
        arguments: {'title': _store.anime.title, 'id': _store.anime.id},
      ).then((_) => _store.checkIfFavorite()),
      onDoubleTap: _store.favoriteAction,
      child: Container(
        height: 120.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          elevation: 4,
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(10)),
                  child: Image.network(
                    _store.anime.imageUrl,
                    width: 100,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: 15.0,
              ),
              Flexible(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        _store.anime.title,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.fade,
                      )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Nota: ',
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: '${_store.anime.score}',
                                style: TextStyle(color: Colors.red))
                          ])),
                          Observer(
                            builder: (_) => IconButton(
                              icon: Icon(
                                _store.isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                                size: 20,
                                color: Colors.red,
                              ),
                              onPressed: _store.favoriteAction,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get isFavorite => _store.isFavorite;
}
