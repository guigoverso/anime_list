import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Não foi possível carregar os dados',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
