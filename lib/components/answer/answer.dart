import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const Answer(this.text, this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPress(),
      style: TextButton.styleFrom(
          fixedSize: const Size(220, 52),
          disabledBackgroundColor: Colors.grey,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white),
      child: Text(text),
    );
  }
}
