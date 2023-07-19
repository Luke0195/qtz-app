// Scafold é o widget que trás algumas coisa já prontas para gente
// o body não consegue  receber mais um componente

import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Container(
              alignment: Alignment.center,
              child: const Text('Quiz Project!', textAlign: TextAlign.center),
            )),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const Column(children: [
                    Text('Tela de Login',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 23,
                            fontFamily: AutofillHints.creditCardName)),
                    Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter with your name',
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              )),
                          enabled: true,
                        )
                      ],
                    )
                  ]),
                )
              ],
            )));
  }
}
