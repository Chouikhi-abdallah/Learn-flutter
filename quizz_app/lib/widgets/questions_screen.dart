import 'package:flutter/foundation.dart'; //this package is used to check if the app is in debug mode
import 'package:flutter/material.dart';// this is the material desing package of google
import 'package:google_fonts/google_fonts.dart'; // this is a package that will be used to style the text 
import 'package:quizz_app/widgets/answer_button.dart'; // this is a widget that will be used to create a button with a gradient background
import '../data/questions.dart'; // imported the dummy data that will be used to create the questions

class QuestionsScreen extends StatefulWidget { // this is a stateful widget that will be used to create the screen that will display the questions and it's statful because the index of the question will change
  final void Function(String answer) onSelectAnswer; // this is a function to be called when the answer is selected and it will be passed as a parameter to the widget
  const QuestionsScreen({super.key,required this.onSelectAnswer});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  int currentIndex=0;

  void changeIndex(){
    setState(() {
      currentIndex++;
      if(currentIndex==questions.length) {
        currentIndex=0;
      }
      if (kDebugMode) {
        print('button clicked');
      }
  });
  }

  
  
  @override
  Widget build(BuildContext context) {
    final currentQuestion=questions[currentIndex];
    return SizedBox( // this is a widget that will take the whole screen
      width: double.infinity, // the width of the widget will be the width of the screen
      child: Container( // this is a container that will contain the questions and the answers
        margin: const EdgeInsets.all(50), // this is the margin of the container
        child: Column(// this is a column that will contain the questions and the answers
        
          crossAxisAlignment: CrossAxisAlignment.stretch, // this is the alignment of the column crossAxisAlignement is the horizontal alignment
          mainAxisAlignment: MainAxisAlignment.center,   // this is the alignment of the column mainAxisAlignement is the vertical alignment 
          
          children: [
             Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              
              ),
                
            ),
            const SizedBox(height: 20,),
            ...currentQuestion.shuffeledList().map((answer){
              return AnswerButton(buttonString: answer, onTap: changeIndex);
            }),
          ],
        ),
      ),
    );
  }
}
