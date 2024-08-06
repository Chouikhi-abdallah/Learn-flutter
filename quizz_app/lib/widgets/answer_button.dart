import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      margin: const EdgeInsets.all(7),
      child: ElevatedButton(
          onPressed: onTap,
          
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            backgroundColor: const Color.fromARGB(255, 64, 4, 133),
            foregroundColor: Colors.white,
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            
          ),
          child: Text(
              buttonString,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
              
              ),
                
            )
    )
    );
  }
}
