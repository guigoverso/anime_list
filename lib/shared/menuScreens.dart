import 'package:anime_list/screens/favorites/favorites_screen.dart';
import 'package:anime_list/screens/search/search_screen.dart';
import 'package:anime_list/screens/top/top_screen.dart';
import 'package:flutter/material.dart';

class MenuScreens {
  final Widget _topScreen = TopScreen();
  final Widget _searchScreen = SearchScreen();
  final Widget _favoritesScreen = FavoritesScreen();

  List<Map> _menuScreens = [];

  MenuScreens() {
    _menuScreens
        .add({"screen": _topScreen, "title": "Top", "icon": Icons.star});
    _menuScreens.add(
        {"screen": _searchScreen, "title": "Search", "icon": Icons.search});
    _menuScreens.add(
        {"screen": _favoritesScreen, "title": "Favorites", "icon": Icons.favorite});
  }

  List<Map> get screens => _menuScreens;

  Widget get firstScreen => _menuScreens.first["screen"];
}
