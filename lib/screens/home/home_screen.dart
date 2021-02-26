import 'package:anime_list/screens/home/home_store.dart';
import 'package:anime_list/screens/top/top_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  final _store = Modular.get<HomeStore>();

  void initState() {
    super.initState();
    TabController _tabController = TabController(length: 3, vsync: this);
    _store.setTabController(_tabController);
    _store.index = _store.tabController.index;
    _store.tabController.animation.addListener(() {print(_store.index = _store.tabController.index);});
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('${_store.index}'),
          centerTitle: true,
          backgroundColor: Colors.red,
          bottom: TabBar(
            controller: _store.tabController,
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _store.tabController,
          children: [
            TopScreen(),
            Text('Pesquisar'),
            Text('Favoritos')
          ],
        ),
      ),
    );
  }
}
