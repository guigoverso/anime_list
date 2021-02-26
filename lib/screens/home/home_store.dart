import 'package:anime_list/models/anime_model.dart';
import 'package:anime_list/services/anime_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  TabController _tabController;

  @observable
  int index;

  @computed
  TabController get tabController => _tabController;
  TabController setTabController(TabController tabController) => _tabController = tabController;
  Function getIndex(TabController tabController)  {
    print(index);
  }
}