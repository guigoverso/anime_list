import 'package:anime_list/models/anime_model.dart';
import 'package:dio/dio.dart';

class AnimeService {
  final Dio dio;

  AnimeService(this.dio);

  Future<List<Anime>> searchAnime({String anime}) async{
    String url = '';
    String path = '';
    if(anime == null) {
      url = '/top/anime';
      path = 'top';
    } else {
      url = '/search/anime?q=$anime';
      path = 'results';
    }
    Response response = await dio.get(url);
    List<Anime> animeList = [];
    response.data[path].forEach((anime) => animeList.add(Anime.fromJson(anime)));
    return animeList;
  }
}