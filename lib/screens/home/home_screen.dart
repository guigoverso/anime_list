import 'package:anime_list/database/local_storage.dart';
import 'package:anime_list/models/favorite_model.dart';
import 'package:anime_list/screens/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  final _store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Anime List - ${_store.titleCurrentScreen}'),
              centerTitle: true,
              backgroundColor: Colors.red,
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => {LocalStorage.add(Favorite(title: 'Anime de Teste')), LocalStorage.imprimir()},
            ),
            body: Padding(
              padding: EdgeInsets.all(5.0),
              child: _store.currentScreen,
            ),
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: _store.screensIcons,
              iconSize: 28,
              activeIndex: _store.currentScreenIndex,
              onTap: _store.changeCurrentScreen,
              gapLocation: GapLocation.none,
              splashColor: Colors.white,
              activeColor: Colors.amber,
              inactiveColor: Colors.white,
              leftCornerRadius: 18,
              rightCornerRadius: 18,
              splashSpeedInMilliseconds: 400,
              backgroundColor: Colors.red,
            )),
      ),
    );
  }
}
