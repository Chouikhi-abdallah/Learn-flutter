import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/widgets/answer_button.dart';
import '../data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;
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
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          
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
            /*const SizedBox(height: 20),
            AnswerButton(buttonString: currentQuestions.answers[0], onTap: () {}),
            const SizedBox(height: 20),
            AnswerButton(buttonString: currentQuestions.answers[1], onTap: () {}),
            const SizedBox(height: 20),
            AnswerButton(buttonString: currentQuestions.answers[2], onTap: () {}),
            const SizedBox(height: 20),
            AnswerButton(buttonString: currentQuestions.answers[3], onTap: () {}),*/
          ],
        ),
      ),
    );
  }
}
