// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  Computed<List<Anime>> _$searchResultComputed;

  @override
  List<Anime> get searchResult => (_$searchResultComputed ??=
          Computed<List<Anime>>(() => super.searchResult,
              name: '_SearchStore.searchResult'))
      .value;

  final _$_searchResultAtom = Atom(name: '_SearchStore._searchResult');

  @override
  List<Anime> get _searchResult {
    _$_searchResultAtom.reportRead();
    return super._searchResult;
  }

  @override
  set _searchResult(List<Anime> value) {
    _$_searchResultAtom.reportWrite(value, super._searchResult, () {
      super._searchResult = value;
    });
  }

  final _$_searchStatusAtom = Atom(name: '_SearchStore._searchStatus');

  @override
  Status get _searchStatus {
    _$_searchStatusAtom.reportRead();
    return super._searchStatus;
  }

  @override
  set _searchStatus(Status value) {
    _$_searchStatusAtom.reportWrite(value, super._searchStatus, () {
      super._searchStatus = value;
    });
  }

  @override
  String toString() {
    return '''
searchResult: ${searchResult}
    ''';
  }
}
