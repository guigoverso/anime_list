// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsStore on _DetailsStore, Store {
  Computed<Icon> _$favoriteIconComputed;

  @override
  Icon get favoriteIcon =>
      (_$favoriteIconComputed ??= Computed<Icon>(() => super.favoriteIcon,
              name: '_DetailsStore.favoriteIcon'))
          .value;

  final _$dataStatusAtom = Atom(name: '_DetailsStore.dataStatus');

  @override
  Status get dataStatus {
    _$dataStatusAtom.reportRead();
    return super.dataStatus;
  }

  @override
  set dataStatus(Status value) {
    _$dataStatusAtom.reportWrite(value, super.dataStatus, () {
      super.dataStatus = value;
    });
  }

  final _$viewFullSynopsisAtom = Atom(name: '_DetailsStore.viewFullSynopsis');

  @override
  bool get viewFullSynopsis {
    _$viewFullSynopsisAtom.reportRead();
    return super.viewFullSynopsis;
  }

  @override
  set viewFullSynopsis(bool value) {
    _$viewFullSynopsisAtom.reportWrite(value, super.viewFullSynopsis, () {
      super.viewFullSynopsis = value;
    });
  }

  final _$isFavoriteAtom = Atom(name: '_DetailsStore.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  @override
  String toString() {
    return '''
dataStatus: ${dataStatus},
viewFullSynopsis: ${viewFullSynopsis},
isFavorite: ${isFavorite},
favoriteIcon: ${favoriteIcon}
    ''';
  }
}
