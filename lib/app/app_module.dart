import 'package:anime_list/app/app_widget.dart';
import 'package:anime_list/screens/home/home_screen.dart';
import 'package:anime_list/services/anime_service.dart';
import 'package:anime_list/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
    Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
    Bind((i) => AnimeService(i.get()))
  ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, __) => HomeScreen()),
  ];

}