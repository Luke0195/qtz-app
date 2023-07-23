import 'package:flutter/material.dart';
import 'components/question/question.dart';
import 'components/answer/answer.dart';

main() {
  runApp(const App());
}

class _AppState extends State<App> {
  int _selectedQuestions = 0;

  int get getSelectedQuestion {
    return _selectedQuestions;
  }

  List<String> questions = [
    'Qual é a sua linguagem favorita?',
    'Qual é  o framework do momento?',
    'Qual é a nível profissional?'
  ];

  void _answer() {
    if (_selectedQuestions == 2) {
      _selectedQuestions = 0;
      setState(() {
        _selectedQuestions;
      });
      return;
    }
    setState(() {
      _selectedQuestions++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                toolbarHeight: 60,
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Text('Quiz Project'),
                    ),
                    Icon(Icons.question_answer)
                  ],
                )),
            body: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Question(text: questions[getSelectedQuestion])],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Answer('Resposta 1', _answer),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Answer('Resposta 2', _answer),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Answer('Resposta 3', _answer))
              ],
            )));
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() {
    return _AppState();
  }
}
