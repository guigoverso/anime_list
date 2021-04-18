import 'package:anime_list/database/local_storage.dart';
import 'package:anime_list/models/anime_model.dart';
import 'package:mobx/mobx.dart';

part "anime_card_store.g.dart";

class AnimeCardStore = _AnimeCardStore with _$AnimeCardStore;

abstract class _AnimeCardStore with Store {
  _AnimeCardStore(this.anime) {
    checkIfFavorite();
  }

  final Anime anime;

  @observable
  bool isFavorite;

  void favoriteAction() async {
    await LocalStorage.favoriteAction(anime, isFavorite);
   checkIfFavorite();
  }

  void checkIfFavorite() {
    isFavorite = LocalStorage.isFavorite(anime);
    anime.isFavorite = isFavorite;
  }
}