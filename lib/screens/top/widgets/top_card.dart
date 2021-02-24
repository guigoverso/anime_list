import 'package:anime_list/models/anime_model.dart';
import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {

  final Anime anime;
  final int index;

  const TopCard({Key key, this.anime, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: Row(
          children: [
            Text(index < 10 ? '0${index + 1}' : '${index + 1}', style: TextStyle(fontSize: 40.0),),
            SizedBox(width: 20.0,),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                elevation: 4,
                child: Row(
                  children: [
                    ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(10)),
                        child: Image.network(anime.imageUrl, width: 100, fit: BoxFit.cover,)),
                    SizedBox(width: 15.0,),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Text(anime.title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold), overflow: TextOverflow.fade,)),
                            SizedBox(height: 10.0,),
                            RichText(text: TextSpan(
                                children: [
                                  TextSpan(text: 'Nota: ', style: TextStyle(color: Colors.black)),
                                  TextSpan(text: '${anime.score}', style: TextStyle(color: Colors.red))
                                ]
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]
      ),
    );
  }
}
