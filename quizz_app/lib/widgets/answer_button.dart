import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String buttonString;

  const AnswerButton(this.buttonString, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          
        ),
        child: Text(
          buttonString,
          style: const TextStyle(),
        ));
  }
}
