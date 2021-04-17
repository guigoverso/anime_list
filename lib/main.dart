import 'package:anime_list/app/app_module.dart';
import 'package:anime_list/database/local_storage.dart';
import 'package:anime_list/models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(
    ModularApp(
      module: AppModule(),
    ),
  );
}
