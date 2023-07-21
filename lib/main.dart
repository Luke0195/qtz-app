import 'package:flutter/material.dart';

main() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var questions = [
      'Qual é a sua Linguagem favorita',
      'Qual framework você mais odeia',
      'Qual a sua visão para o futuro'
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text('Quiz Project')),
              Icon(Icons.quiz)
            ],
          )),
      body: Column(children: [
        Text(questions[0]),
        ElevatedButton(
          onPressed: null,
          style: TextButton.styleFrom(
              fixedSize: const Size(240, 45),
              backgroundColor: Colors.purple,
              disabledBackgroundColor: Colors.grey),
          child: const Text('Reposta  1',
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        ElevatedButton(
          onPressed: null,
          style: TextButton.styleFrom(
              fixedSize: const Size(240, 45),
              backgroundColor: Colors.purple,
              disabledBackgroundColor: Colors.grey),
          child: const Text('Reposta  2',
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        ElevatedButton(
          onPressed: null,
          style: TextButton.styleFrom(
              fixedSize: const Size(240, 45),
              backgroundColor: Colors.purple,
              disabledBackgroundColor: Colors.grey),
          child: const Text('Reposta  2',
              style: TextStyle(
                color: Colors.white,
              )),
        )
      ]),
    ));
  }
}
