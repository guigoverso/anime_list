import 'package:anime_list/database/local_storage.dart';
import 'package:anime_list/models/anime_model.dart';
import 'package:mobx/mobx.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStore with _$FavoritesStore;

abstract class _FavoritesStore with Store {
  _FavoritesStore() {
    fetchFavorites();
  }

  @observable
  ObservableList<dynamic> favorites;

  void fetchFavorites() {
    favorites = ObservableList.of(LocalStorage.fetchFavorites());
    favorites.sort((a, b) => a.title.compareTo(b.title));
  }

  void removeFavorite(Anime anime) async {
    await LocalStorage.favoriteAction(anime, anime.isFavorite);
    favorites.remove(anime);
  }

  void removeAllfavorites() async {
    await LocalStorage.clear();
    fetchFavorites();
  }
}
