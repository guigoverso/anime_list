import 'package:anime_list/models/anime_model.dart';
import 'package:anime_list/services/anime_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'top_store.g.dart';

class TopStore = _TopStore with _$TopStore;

abstract class _TopStore with Store {
  final AnimeService _store;
  List<Anime> _topAnimes = [];

  _TopStore(this._store) {
    _isDataDownloaded = false;
    _fetchTopAnimes();
  }

  @computed
  List<Anime> get topAnimes => _topAnimes;

  @observable
  bool _isDataDownloaded;

  @computed
  bool get isDataDownloaded => _isDataDownloaded;
  void setDataDownloaded() => _isDataDownloaded = true;

  _fetchTopAnimes() async {
    _topAnimes = await _store.fetchTopAnimes();
    setDataDownloaded();
  }
}