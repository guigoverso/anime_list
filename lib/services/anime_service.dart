import 'package:anime_list/models/anime_model.dart';
import 'package:dio/dio.dart';

class AnimeService {
  final Dio dio;

  AnimeService(this.dio);

  Future<List<Anime>> searchAnime(String anime) async{
    try {
      Response response = await dio.get('/search/anime?q=$anime');
      if(response.statusCode == 200) {
        List<Anime> animeList = [];
        response.data['results'].forEach((anime) => animeList.add(Anime.fromJson(anime)));
        return animeList;
      }
    } catch(e) {
      throw "Erro de requisção";
    }
  }

  Future<List<Anime>> fetchTopAnimes() async {
    try {
      Response response = await dio.get('/top/anime');
      if(response.statusCode == 200) {
        List<Anime> animeList = [];
        response.data['top'].forEach((anime) => animeList.add(Anime.fromJson(anime)));
        return animeList;
      }
    } catch (e) {
      throw "Erro de requisição";
    }
  }

}