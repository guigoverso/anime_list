import 'package:anime_list/models/favorite_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalStorage {
  LocalStorage._();

  static final LocalStorage _instance = LocalStorage._();

  static var _favorites;

  static void init() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(FavoriteAdapter());
    _favorites = await Hive.openBox('favorites');
  }

  static List<dynamic> fetchFavorites() {
    return _favorites.values.toList();
  }

  static void add(Favorite newFavorite) {
    _favorites.add(newFavorite);
  }

  static void remove(int id) {
    final removable =
        _favorites.values.firstWhere((favorite) => favorite.id == id);
    _favorites.delete(removable.key);
  }

  static void clear() {
    _favorites.clear();
  }

  static void imprimir() {
    print('Tamanho da caixa: ${_favorites.length}');
    print(_favorites.values);
  }

  static int get qnt => _favorites.length;
}