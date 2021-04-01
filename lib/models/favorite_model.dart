import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 1)
class Favorite extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  String imageUrl;
  @HiveField(2)
  String title;
  @HiveField(3)
  String synopsis;
  @HiveField(4)
  int episodes;
  @HiveField(5)
  double score;
  @HiveField(6)
  bool isFavorite;

  Favorite(
      {this.id,
      this.imageUrl,
      this.title,
      this.synopsis,
      this.episodes,
      this.score});
}
