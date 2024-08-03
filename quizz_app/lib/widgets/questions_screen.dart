import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/answer_button.dart';
import '../data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  final currentQuestions=questions[0];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
             Text(
              currentQuestions.text,
              textAlign: TextAlign.center,
              style:const  TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20,),
            ...currentQuestions.shuffeledList().map((answer){
              return AnswerButton(buttonString: answer, onTap: (){});
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
