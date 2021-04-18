import 'package:anime_list/models/anime_model.dart';
import 'package:mobx/mobx.dart';

abstract class _AnimeCardStore with Store {
  _AnimeCardStore(this.anime);

  final Anime anime;

  @observable
  bool isFavorite;

  void favoriteAction() {
   if(isFavorite) {

   }
  }
}