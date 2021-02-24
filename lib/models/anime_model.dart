class Anime {
  int id;
  String imageUrl;
  String title;
  String synopsis;
  int episodes;

  Anime(
      {this.id,
        this.imageUrl,
        this.title,
        this.synopsis,
        this.episodes,});

  Anime.fromJson(Map<String, dynamic> json) {
    id = json['mal_id'];
    imageUrl = json['image_url'];
    title = json['title'];
    synopsis = json['synopsis'];
    episodes = json['episodes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['title'] = this.title;
    data['synopsis'] = this.synopsis;
    data['episodes'] = this.episodes;
    return data;
  }
}