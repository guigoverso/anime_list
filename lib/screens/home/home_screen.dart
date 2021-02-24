import 'package:anime_list/screens/top/top_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        title: Text('Anime List'),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          TopScreen(),
          Text('Pesquisar'),
          Text('Favoritos')
        ],
      ),
    ));
  }
}
