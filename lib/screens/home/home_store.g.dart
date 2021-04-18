// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<List<Map<dynamic, dynamic>>> _$screensComputed;

  @override
  List<Map<dynamic, dynamic>> get screens => (_$screensComputed ??=
          Computed<List<Map<dynamic, dynamic>>>(() => super.screens,
              name: '_HomeStore.screens'))
      .value;

  final _$_currentScreenAtom = Atom(name: '_HomeStore._currentScreen');

  @override
  Widget get _currentScreen {
    _$_currentScreenAtom.reportRead();
    return super._currentScreen;
  }

  @override
  set _currentScreen(Widget value) {
    _$_currentScreenAtom.reportWrite(value, super._currentScreen, () {
      super._currentScreen = value;
    });
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  dynamic changeCurrentScreen(int index) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.changeCurrentScreen');
    try {
      return super.changeCurrentScreen(index);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
screens: ${screens}
    ''';
  }
}
