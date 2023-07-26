// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:qzt/components/questionary/questionary.dart';
import 'components/answer/answer.dart';
import 'components/result/result.dart';

main() {
  runApp(const App());
}

class _AppState extends State<App> {
  int _selectedQuestions = 0;

  int get getSelectedQuestion {
    return _selectedQuestions;
  }

  // O object também pode representar uma lista, com const as coisas serão otimizadas.
  final List<Map<String, Object>> _questions = const [
    {
      'text': 'Qual é a sua linguagem favorita?',
      'resposta': ['PHP', 'Java', 'C#', "Javascript", 'GO', 'Ruby']
    },
    {
      'text': 'Qual é a seu nível de senioridade?',
      'resposta': ['Estagiário', 'Trainee', 'Junior', 'Pleno', 'Senior', 'God']
    },
    {
      'text': 'Qual desses frameworks você já usou?',
      'resposta': ['Laravel', 'Angular', 'Vue', 'Spring', 'Django', '.NET']
    },
    {
      'text': 'Em quais dessas áreas você deseja se especializar?',
      'resposta': [
        'Front-end',
        'Backend',
        'Mobile',
        'Fullstack',
        'DevOps',
        'Engenharia de Dados'
      ]
    }
  ];

  bool get hasSelectedQuestions {
    return _selectedQuestions < _questions.length;
  }

  void _answer() {
    setState(() {
      _selectedQuestions++;
    });
  }

  void _restart() {
    setState(() {
      _selectedQuestions = _questions.length + 1;
    });
  }

  List<Widget> parsedMapQuestionsToListWidget(List<Map<String, Object>> data) {
    // fazemos a conversão dos widgets e jogamo na nossa árvore de elementos.
    List<String> dataQuestions =
        data[_selectedQuestions]['resposta'] as List<String>;
    return hasSelectedQuestions
        ? dataQuestions.map((element) {
            return Answer(text: element, onPress: () => _answer());
          }).toList()
        : [];
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
                : Result(onPress: () => _restart())));
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() {
    return _AppState();
  }
}
