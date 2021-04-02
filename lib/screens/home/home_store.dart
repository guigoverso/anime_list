import 'package:anime_list/screens/favorites/favorites_store.dart';
import 'package:anime_list/shared/menuScreens.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final MenuScreens _menuScreens;
  final FavoritesStore _favoritesStore;

  _HomeStore(this._menuScreens, this._favoritesStore) {
    _currentScreen = _menuScreens.firstScreen;
    _currentScreenIndex = 0;
  }

  @observable
  Widget _currentScreen;
  int _currentScreenIndex;

  @computed
  List<Map> get screens => _menuScreens.screens;
  Widget get currentScreen => _currentScreen;
  int get currentScreenIndex => _currentScreenIndex;
  String get titleCurrentScreen =>
      _menuScreens.screens[_currentScreenIndex]["title"];
  List<IconData> get screensIcons => _screensIcons();

  @action
  changeCurrentScreen(int index) {
    _currentScreen = _menuScreens.screens[index]["screen"];
    _currentScreenIndex = index;
  }

  Function get removeAllFavorites => _favoritesStore.removeAllfavorites;

  List<IconData> _screensIcons() {
    List<IconData> list = [];
    _menuScreens.screens.forEach((screen) {
      list.add(screen["icon"]);
    });
    return list;
  }
}
