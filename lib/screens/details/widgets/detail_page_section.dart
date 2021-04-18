import 'package:flutter/material.dart';

class DetailPageSection extends StatelessWidget {
  final Widget content;

  const DetailPageSection({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          elevation: 5.0,
          child: Container(padding: EdgeInsets.all(10.0), child: content),
        ),
      ),
    );
  }
}
