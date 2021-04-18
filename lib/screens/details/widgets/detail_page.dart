import 'package:anime_list/models/anime_model.dart';
import 'package:anime_list/screens/details/widgets/synopsis_view.dart';
import 'package:anime_list/screens/details/widgets/detail_page_section.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Anime anime;

  const DetailPage({Key key, this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 480,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              anime.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              DetailPageSection(
                content: Text(
                  anime.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DetailPageSection(
                content: SynopsisView(synopsis: anime.synopsis),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DetailPageSection(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Episodes:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                              textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10),
                        Text(
                          anime.episodes.toString(),
                          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  DetailPageSection(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Score:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10),
                        Text(
                          anime.score.toString(),
                          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
