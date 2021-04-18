import 'package:anime_list/models/anime_model.dart';
import 'package:anime_list/services/anime_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../shared/constants.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  final AnimeService _service;
  TextEditingController controller = TextEditingController();

  _SearchStore(this._service);

  @observable
  List<Anime> _searchResult = [];

  @observable
  Status _searchStatus = Status.none;

  @computed
  List<Anime> get searchResult => _searchResult;

  Status get searchStatus => _searchStatus;

  fetchSearchResult() async {
    if (controller.text == '') {
      _searchStatus = Status.none;
      return null;
    }
    _searchStatus = Status.waiting;
    try {
      _searchResult = await _service.searchAnime(controller.text);
      _searchStatus = Status.success;
    } catch (e) {
      _searchStatus = Status.error;
    }
  }
}
