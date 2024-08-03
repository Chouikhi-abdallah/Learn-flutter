import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String buttonString;

  final void Function() onTap;

  const AnswerButton( {
    super.key,
    required this.buttonString,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
          onPressed: onTap,
          
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            backgroundColor: const Color.fromARGB(255, 64, 4, 133),
            foregroundColor: Colors.white,
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            
          ),
          child: Text(
            buttonString,
            style: const TextStyle(
              fontSize: 16
              
            ),
            textAlign: TextAlign.center,
          )),
    );
  }
}
