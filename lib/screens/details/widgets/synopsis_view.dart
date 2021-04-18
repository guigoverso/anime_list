import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../details_store.dart';

class SynopsisView extends StatelessWidget {
  final _store = Modular.get<DetailsStore>();

  String synopsis;
  String firstHalf;

  SynopsisView({Key key, this.synopsis}) : super(key: key) {
    synopsisView();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Synopsis:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(height: 10),
          Text(
            _store.viewFullSynopsis ? synopsis : firstHalf,
            style: TextStyle(height: 1.7),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: firstHalf != null,
              child: SizedBox(
                height: 28.0,
                width: 28.0,
                child: IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: 28.0,
                    icon: _store.viewFullSynopsis ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
                    onPressed: () =>
                        _store.viewFullSynopsis = !_store.viewFullSynopsis),
              ),
            ),
          )
        ],
      ),
    );
  }

  void synopsisView() {
    if(synopsis == null) {
      synopsis = 'Synopsis unavailable';
    }
    if (synopsis.length > 200) {
      firstHalf = '${synopsis.substring(0, 200)}...';
    } else {
      _store.viewFullSynopsis = true;
    }
  }
}
