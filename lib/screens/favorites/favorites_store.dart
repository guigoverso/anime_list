import 'package:anime_list/database/local_storage.dart';
import 'package:mobx/mobx.dart';
import '../../models/favorite_model.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStore with _$FavoritesStore;

abstract class _FavoritesStore with Store {
  _FavoritesStore() {
    _fetchFavorites();
  }

  ObservableList<dynamic> favorites;

  void _fetchFavorites() {
    favorites = ObservableList.of(LocalStorage.fetchFavorites());
  }

  void addFavorite(Favorite newFavorite) {
    LocalStorage.add(newFavorite);
    _fetchFavorites();
  }

  void removeFavorite(int id) {
    LocalStorage.remove(id);
    _fetchFavorites();
  }

  void removeAllfavorites() {
    LocalStorage.clear();
    _fetchFavorites();
  }
}
