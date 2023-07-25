import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Question extends StatelessWidget {
  String text;

  Question({
    this.text = '',
    super.key,
  });

  String get getText {
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(getText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ))));
  }
}
