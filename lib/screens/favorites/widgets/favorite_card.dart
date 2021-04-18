import 'package:anime_list/models/anime_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../favorites_store.dart';

class FavoriteCard extends StatelessWidget {
  final Anime anime;
  FavoritesStore _store;

  FavoriteCard({Key key, @required this.anime, @required store})
      : super(key: key) {
    _store = store;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed(
        '/details',
        arguments: {'title': anime.title, 'id': anime.id},
      ).then((_) => _store.fetchFavorites()),
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
                    anime.imageUrl,
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
                          anime.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Nota: ',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: '${anime.score}',
                                    style: TextStyle(color: Colors.red))
                              ],
                            ),
                          ),
                          IconButton(
                            constraints: BoxConstraints(maxHeight: 20),
                            padding: EdgeInsets.all(0),
                            icon: Icon(
                              Icons.favorite,
                              size: 20,
                              color: Colors.red,
                            ),
                            onPressed: () => _store.removeFavorite(anime),
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
}
