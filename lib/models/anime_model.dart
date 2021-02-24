class Anime {
  int id;
  String imageUrl;
  String title;
  String synopsis;
  int episodes;
  double score;

  Anime(
      {this.id,
        this.imageUrl,
        this.title,
        this.synopsis,
        this.episodes,
        this.score});

  Anime.fromJson(Map<String, dynamic> json) {
    id = json['mal_id'];
    imageUrl = json['image_url'];
    title = json['title'];
    synopsis = json['synopsis'];
    episodes = json['episodes'];
    score = json['score'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['title'] = this.title;
    data['synopsis'] = this.synopsis;
    data['episodes'] = this.episodes;
    data['score'] = this.score;
    return data;
  }
}