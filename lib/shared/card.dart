import 'package:anime_list/models/anime_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;

  AnimeCard({Key key, this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                              text: '${anime.score}',
                              style: TextStyle(color: Colors.red))
                        ])),
                        Icon(Icons.favorite_border_outlined, size: 20, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
