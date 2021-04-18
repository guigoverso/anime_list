import 'package:anime_list/database/local_storage.dart';
import 'package:anime_list/services/anime_service.dart';
import 'package:anime_list/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../models/anime_model.dart';

part 'details_store.g.dart';

class DetailsStore = _DetailsStore with _$DetailsStore;

abstract class _DetailsStore with Store {
  Anime anime;
  final int id;
  final String title;
  final AnimeService _service;

  _DetailsStore(this.id, this.title, this._service) {
    _fetchAnime();
  }

  @observable
  Status dataStatus = Status.none;

  @observable
  bool viewFullSynopsis = false;

  @observable
  bool isFavorite;

  @computed
  Icon get favoriteIcon {
    if(dataStatus != Status.success) {
      return Icon(Icons.favorite, color: Colors.transparent,);
    }
    return isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border);
  }


  _fetchAnime() async {
    dataStatus = Status.waiting;
    try {
      anime = await _service.fetchAnime(id);
      checkIfFavorite();
      dataStatus = Status.success;
    } catch (e) {
      dataStatus = Status.error;
    }
  }

  void favoriteAction() async {
    await LocalStorage.favoriteAction(anime, isFavorite);
    checkIfFavorite();
  }

  void checkIfFavorite() {
    isFavorite = LocalStorage.isFavorite(anime);
    anime.isFavorite = isFavorite;
  }
}
