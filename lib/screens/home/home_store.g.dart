// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<TabController> _$tabControllerComputed;

  @override
  TabController get tabController => (_$tabControllerComputed ??=
          Computed<TabController>(() => super.tabController,
              name: '_HomeStore.tabController'))
      .value;

  final _$_tabControllerAtom = Atom(name: '_HomeStore._tabController');

  @override
  TabController get _tabController {
    _$_tabControllerAtom.reportRead();
    return super._tabController;
  }

  @override
  set _tabController(TabController value) {
    _$_tabControllerAtom.reportWrite(value, super._tabController, () {
      super._tabController = value;
    });
  }

  final _$indexAtom = Atom(name: '_HomeStore.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  @override
  String toString() {
    return '''
index: ${index},
tabController: ${tabController}
    ''';
  }
}
