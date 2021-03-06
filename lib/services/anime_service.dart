import 'package:anime_list/models/anime_model.dart';
import 'package:dio/dio.dart';

class AnimeService {
  final Dio dio;

  AnimeService(this.dio);

  Future<List<Anime>> searchAnime(String anime) async {
    Response response = await dio.get('/search/anime?q=$anime');
    if (response.statusCode == 200) {
      List<Anime> animeList = [];
      response.data['results']
          .forEach((anime) => animeList.add(Anime.fromJson(anime)));
      return animeList;
    }
  }

  Future<List<Anime>> fetchTopAnimes() async {
    Response response = await dio.get('/top/anime');
    if (response.statusCode == 200) {
      List<Anime> animeList = [];
      response.data['top']
          .forEach((anime) => animeList.add(Anime.fromJson(anime)));
      return animeList;
    }
  }

  Future<Anime> fetchAnime(int id) async {
    Response response = await dio.get('/anime/$id');
    return Anime.fromJson(response.data);
  }
}
