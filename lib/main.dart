import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

// O flutter utiliza a mesma ideia do react para atualização de estado.
// O ideia é que usemos sempre widgets sem estado mas devemos passar os valores no construtor
class MyAppState extends State<MyApp> {
  int selectedQuestions = 0;

  void answerQuestion() {
    if (selectedQuestions == 2) {
      setState(() {
        selectedQuestions = 0;
      });
      return;
    }
    setState(() {
      selectedQuestions++;
    });
    print(selectedQuestions);
  }

  @override
  Widget build(BuildContext context) {
    List<String> perguntas = [
      'Qual é a sua linguagem favorita?',
      'Qual é o seu nível de senioridade',
      'Qual é o framework do momento'
    ];

    Map<String, List<String>> awnsersByQuestions = {
      'Qual a sua linguagem favorita?': ['Java' 'JavaScript', 'PHP', 'C#'],
      'Qual é o seu nível de senioridade? ': [
        'Estagiário',
        'Trainee',
        'Junior' 'Pleno',
        'Senior'
      ],
      'Qual é o framework front-end do momento?': [
        'React',
        'Angular',
        'Vue',
        'Svelte'
      ]
    };

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blueGrey[400],
                toolbarHeight: 62,
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Text('Quiz Project')),
                    Icon(Icons.question_answer)
                  ],
                )),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(perguntas[selectedQuestions])),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            fixedSize: const Size(200, 42),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueGrey[400],
                            disabledBackgroundColor: Colors.grey),
                        onPressed: answerQuestion,
                        child: const Text("Java")),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: TextButton(
                        onPressed: answerQuestion,
                        style: TextButton.styleFrom(
                            disabledBackgroundColor: Colors.grey,
                            fixedSize: const Size(200, 42),
                            backgroundColor: Colors.blueGrey[400],
                            foregroundColor: Colors.white),
                        child: const Text('JavaScript'),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextButton(
                        onPressed: answerQuestion,
                        style: TextButton.styleFrom(
                            fixedSize: const Size(200, 42),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueGrey[400],
                            disabledBackgroundColor: Colors.grey),
                        child: const Text('PHP'),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextButton(
                        onPressed: answerQuestion,
                        style: TextButton.styleFrom(
                            fixedSize: const Size(200, 42),
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: Colors.grey,
                            backgroundColor: Colors.blueGrey[400]),
                        child: const Text('C#')),
                  )
                ],
              ),
            )));
  }
} //Devemos adicionar uma classe state que será responsável por controllar o estado da nossa aplicação.

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}
