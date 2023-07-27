import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final void Function() onPress;
  final int score;

  const Result({super.key, required this.onPress, required this.score});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          const Text(
            'Parabéns',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const Icon(Icons.celebration),
          Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('Sua pontuação foi $score pts!',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold))),
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: TextButton(
                    onPressed: () => onPress(),
                    style: TextButton.styleFrom(
                        fixedSize: const Size(240, 52),
                        backgroundColor: Colors.blue),
                    child: const Text('Começar novamente',
                        style: TextStyle(color: Colors.white)),
                  ))
            ],
          )
        ]));
  }
}
