import 'package:flutter/material.dart'; // this is the material desing package of google
import 'package:google_fonts/google_fonts.dart'; // this is a package that will be used to style the text

class AnswerButton extends StatelessWidget { // the button as it's state doesn't change it's a stateless widget
  final String buttonString; // it has a string as an attribute

  final void Function() onTap; // a function that will be called when the button is clicked 

  const AnswerButton( {
    super.key,
    required this.buttonString,   // this is a constructor
    required this.onTap});

  @override
  Widget build(BuildContext context) { // this is the function that will build the widget
    return Container(           // we put the button into a container to give it a margin
      margin: const EdgeInsets.all(7), // we give the container a margin of 7 -> the margin is the space between the container and the other widgets but the padding is the space between the container and the content
      child: ElevatedButton( // this is the button that will be displayed on the screen
          onPressed: onTap, // and it excute the function that was passed as a parameter when the button is clicked
          
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
