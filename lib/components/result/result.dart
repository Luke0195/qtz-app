import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(
            'Parabéns!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Icon(Icons.celebration)
        ]));
  }
}
