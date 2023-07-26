import 'package:flutter/material.dart';
import '../question/question.dart';

class Questionary extends StatelessWidget {
  final String questionText;
  final List<Widget> result;

  const Questionary(
      {super.key, required this.questionText, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Question(text: questionText),
            ...result,
            // podemos passar o spread na lista de widget
          ],
        ),
      ],
    );
  }
}
