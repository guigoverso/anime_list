import 'package:anime_list/app/app_widget.dart';
import 'package:anime_list/screens/details/details_screen.dart';
import 'package:anime_list/screens/details/details_store.dart';
import 'package:anime_list/screens/home/home_screen.dart';
import 'package:anime_list/screens/home/home_store.dart';
import 'package:anime_list/screens/top/top_screen.dart';
import 'package:anime_list/screens/top/top_store.dart';
import 'package:anime_list/screens/search/search_store.dart';
import 'package:anime_list/services/anime_service.dart';
import 'package:anime_list/shared/constants.dart';
import 'package:anime_list/shared/menuScreens.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
        Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
        Bind((i) => AnimeService(i.get())),
        Bind((i) => MenuScreens()),
        Bind((i) => HomeStore(i.get())),
        Bind((i) => TopStore(i.get())),
        Bind((i) => SearchStore(i.get())),
        Bind(
            (i) => DetailsStore(
                  i.args.data['id'],
                  i.args.data['title'],
                  i.get(),
                ),
            singleton: false)
      ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, __) => HomeScreen(),
        ),
        ModularRouter(
          '/details',
          child: (_, __) => DetailsScreen(),
        )
      ];
}
