import 'package:anime_list/models/favorite_model.dart';
import 'package:hive/hive.dart';

class FavoriteAdapter extends TypeAdapter<Favorite> {
  @override
  Favorite read(BinaryReader reader) {
    // TODO: implement read
    return Favorite()..id = reader.read();
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Favorite obj) {
    // TODO: implement write
    writer.write(obj);
  }
}
