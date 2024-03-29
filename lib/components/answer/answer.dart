import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final int value;
  final void Function(int value) onPress;

  const Answer(
      {required this.text,
      required this.value,
      required this.onPress,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TextButton(
              onPressed: () => onPress(value),
              style: TextButton.styleFrom(
                  fixedSize: const Size(220, 52),
                  disabledBackgroundColor: Colors.grey,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white),
              child: Text(text),
            )));
  }
}
