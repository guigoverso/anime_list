import 'package:anime_list/services/anime_service.dart';
import 'package:anime_list/shared/constants.dart';
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

  _fetchAnime() async {
    dataStatus = Status.waiting;
    try {
      anime = await _service.fetchAnime(id);
      dataStatus = Status.success;
    } catch (e) {
      dataStatus = Status.error;
    }
  }
}
