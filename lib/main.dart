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

  // O object também pode representar uma lista
  final List<Map<String, Object>> questions = [
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

  void _answer() {
    if (_selectedQuestions == 3) {
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

  List<Widget> parsedMapQuestionsToListWidget(List<Map<String, Object>> data) {
    List<String> dataQuestions =
        data[_selectedQuestions]['resposta'] as List<String>;
    return dataQuestions
        .map((element) => Answer(text: element, onPress: _answer))
        .toList();
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
                  children: [
                    Question(
                        text: questions[_selectedQuestions]['text'].toString()),
                    ...parsedMapQuestionsToListWidget(
                        questions) // podemos passar o spread na lista de widget
                  ],
                ),
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
