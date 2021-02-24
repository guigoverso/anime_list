// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TopStore on _TopStore, Store {
  Computed<List<Anime>> _$topAnimesComputed;

  @override
  List<Anime> get topAnimes =>
      (_$topAnimesComputed ??= Computed<List<Anime>>(() => super.topAnimes,
              name: '_TopStore.topAnimes'))
          .value;
  Computed<bool> _$isDataDownloadedComputed;

  @override
  bool get isDataDownloaded => (_$isDataDownloadedComputed ??= Computed<bool>(
          () => super.isDataDownloaded,
          name: '_TopStore.isDataDownloaded'))
      .value;

  final _$_isDataDownloadedAtom = Atom(name: '_TopStore._isDataDownloaded');

  @override
  bool get _isDataDownloaded {
    _$_isDataDownloadedAtom.reportRead();
    return super._isDataDownloaded;
  }

  @override
  set _isDataDownloaded(bool value) {
    _$_isDataDownloadedAtom.reportWrite(value, super._isDataDownloaded, () {
      super._isDataDownloaded = value;
    });
  }

  @override
  String toString() {
    return '''
topAnimes: ${topAnimes},
isDataDownloaded: ${isDataDownloaded}
    ''';
  }
}
