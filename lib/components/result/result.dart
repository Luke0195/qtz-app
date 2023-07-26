import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final void Function() onPress;

  const Result({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          const Text(
            'Parabéns!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const Icon(Icons.celebration),
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
