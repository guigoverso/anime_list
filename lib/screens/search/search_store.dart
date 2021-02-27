import 'package:anime_list/models/anime_model.dart';
import 'package:anime_list/services/anime_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  final AnimeService _service;
  TextEditingController controller = TextEditingController();

  _SearchStore(this._service);

  @observable
  List<Anime> _searchResult = [];

  @computed
  List<Anime> get searchResult => _searchResult;

  fetchSearchResult() async {
    _searchResult = await _service.searchAnime(controller.text);
    return null;
  }
}
