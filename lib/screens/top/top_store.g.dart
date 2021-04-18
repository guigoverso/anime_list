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
  Computed<Status> _$dataStatusComputed;

  @override
  Status get dataStatus =>
      (_$dataStatusComputed ??= Computed<Status>(() => super.dataStatus,
              name: '_TopStore.dataStatus'))
          .value;

  final _$_dataStatusAtom = Atom(name: '_TopStore._dataStatus');

  @override
  Status get _dataStatus {
    _$_dataStatusAtom.reportRead();
    return super._dataStatus;
  }

  @override
  set _dataStatus(Status value) {
    _$_dataStatusAtom.reportWrite(value, super._dataStatus, () {
      super._dataStatus = value;
    });
  }

  @override
  String toString() {
    return '''
topAnimes: ${topAnimes},
dataStatus: ${dataStatus}
    ''';
  }
}
