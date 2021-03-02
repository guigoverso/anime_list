import 'package:anime_list/models/anime_model.dart';
import 'package:anime_list/services/anime_service.dart';
import 'package:mobx/mobx.dart';

import '../../shared/constants.dart';

part 'top_store.g.dart';

class TopStore = _TopStore with _$TopStore;

abstract class _TopStore with Store {
  final AnimeService _store;
  List<Anime> _topAnimes = [];

  _TopStore(this._store) {
    _dataStatus = Status.none;
    _fetchTopAnimes();
  }

  @computed
  List<Anime> get topAnimes => _topAnimes;

  @observable
  Status _dataStatus;

  @computed
  Status get dataStatus => _dataStatus;

  _fetchTopAnimes() async {
    try {
      _topAnimes = await _store.fetchTopAnimes();
      _dataStatus = Status.success;
    } catch(e) {
      _dataStatus = Status.error;
    }
  }
}