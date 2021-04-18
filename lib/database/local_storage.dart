import 'package:anime_list/models/anime_model.dart';
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
    Hive.registerAdapter(AnimeAdapter());
    _favorites = await Hive.openBox('favorites');
  }

  static List<dynamic> fetchFavorites() {
    return _favorites.values.toList();
  }

  static void clear() async {
    await _favorites.clear();
  }

  static Future<bool> favoriteAction(Anime anime, bool isFavorite) async {
    if (isFavorite) {
      final favorite = _favorites.values.firstWhere((favorite) => favorite.id == anime.id);
      await _favorites.delete(favorite.key);
      return false;
    } else {
      await _favorites.add(anime);
      return true;
    }
  }

  static bool isFavorite(Anime anime) {
    return _favorites.values.any((favorite) => favorite.id == anime.id);
  }

  static int get length => _favorites.length;
}
