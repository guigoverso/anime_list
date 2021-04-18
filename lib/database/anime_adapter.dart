import 'package:anime_list/models/anime_model.dart';
import 'package:hive/hive.dart';

class AnimeAdapter extends TypeAdapter<Anime> {
  @override
  Anime read(BinaryReader reader) {
    // TODO: implement read
    return Anime()..id = reader.read();
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Anime obj) {
    // TODO: implement write
    writer.write(obj);
  }

}