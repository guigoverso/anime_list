import 'package:anime_list/models/anime_model.dart';
import 'package:anime_list/shared/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  final Anime anime;
  int index;

  TopCard({Key key, this.anime, cardIndex}) : super(key: key) {
    index = cardIndex + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: Row(children: [
        Text(
          index < 10 ? '0${index}' : '${index}',
          style: TextStyle(fontSize: 30.0),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(child: AnimeCard(anime: anime))
      ]),
    );
  }
}
