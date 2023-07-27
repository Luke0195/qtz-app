// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:qzt/components/questionary/questionary.dart';
import 'components/answer/answer.dart';
import 'components/result/result.dart';

main() {
  runApp(const App());
}

class _AppState extends State<App> {
  final List<Map<String, Object>> _questions = const [
    {
      'text': 'Qual é a sua linguagem favorita?',
      'resposta': [
        {'text': 'PHP', 'value': 10},
        {'text': 'Java', 'value': 11},
        {'text': 'C#', 'value': 12},
        {'text': "Javascript", 'value': 13},
        {'text': 'GO', 'value': 14},
        {'text': 'Ruby', 'value': 15}
      ]
    },
    {
      'text': 'Qual é a seu nível de senioridade?',
      'resposta': [
        {'text': 'Estagiário', 'value': 1},
        {'text': 'Trainee', 'value': 2},
        {'text': 'Junior', 'value': 3},
        {'text': 'Pleno', 'value': 4},
        {'text': 'Senior', 'value': 5}
      ]
    },
    {
      'text': 'Qual desses frameworks você já usou?',
      'resposta': [
        {'text': 'Laravel', 'value': 1},
        {'text': 'Angular', 'value': 2},
        {'text': 'Vue', 'value': 3},
        {'text': 'Spring', 'value': 4},
        {'text': 'Django', 'value': 5},
        {'text': '.NET', 'value': 6},
      ]
    },
    {
      'text': 'Em quais dessas áreas você deseja se especializar?',
      'resposta': [
        {'text': 'Front-end', 'value': 1},
        {'text': 'Back-end', 'value': 2},
        {'text': 'Mobile', 'value': 3},
        {'text': 'FullStack', 'value': 4},
        {'text': 'Devops', 'value': 5},
        {'text': 'Engenharia de Dados', 'value': 6}
      ]
    }
  ];

  List<String> getQuestions(List<Map<String, Object>> result) {
    List<String> questionsData = [];
    for (var item in result) {
      questionsData.add(item['text'] as String);
    }
    return questionsData;
  }

  List<Widget> parsedMapQuestionsToListWidget(List<Map<String, Object>> data) {
    // fazemos a conversão dos widgets e jogamo na nossa árvore de elementos.
    List<Map<String, Object>> result =
        data[_selectedQuestions]['resposta'] as List<Map<String, Object>>;

    var parsedData = result.map((element) {
      return Answer(
          text: element['text'] as String,
          onPress: (int value) => _answer(element['value'] as int),
          value: element['value'] as int);
    });
    return parsedData.toList();
  }

  int _selectedQuestions = 0;
  int score = 0;

  int get getSelectedQuestion {
    return _selectedQuestions;
  }

  // O object também pode representar uma lista, com const as coisas serão otimizadas.

  bool get hasSelectedQuestions {
    return _selectedQuestions < _questions.length;
  }

  void _answer(int value) {
    score += value;
    setState(() {
      _selectedQuestions++;
    });
    print(score);
  }

  void _restart() {
    setState(() {
      _selectedQuestions = 0;
      score = 0;
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
            body: hasSelectedQuestions
                ? Questionary(
                    questionText:
                        _questions[_selectedQuestions]['text'].toString(),
                    result: parsedMapQuestionsToListWidget(_questions))
                : Result(
                    onPress: () => _restart(),
                    score: score,
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
