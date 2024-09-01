

import 'package:flutter/material.dart'; // import the material package
import 'package:quizz_app/widgets/gradient_container.dart'; // import the GradientContainer widget
import 'package:quizz_app/widgets/questions_screen.dart'; // import the QuestionsScreen widget
import 'package:quizz_app/widgets/welcome.dart'; // import the welcome widget

// this is a stateful widget that will be used to create the quiz app
class Quiz extends StatefulWidget{
  const Quiz({super.key});






  @override
  State<Quiz> createState() {
   return _QuizState();
  }
  }


  class _QuizState extends State<Quiz>{
  List<String> answers=[]; 
  String? activeScreen='start-screen';




   void switchScreen(){
    setState(() {
      activeScreen='quiz-screen';
    });
   }
   void chooseAnswer(String answer){
    answers.add(answer);
   } 



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      Scaffold(
        body:GradientContainer(const 
          [Color.fromRGBO(169, 94, 249, 0.597),Color.fromARGB(255, 165, 66, 240),Color.fromARGB(255, 94, 22, 103)
          ,Color.fromARGB(255, 64, 2, 86),Color.fromARGB(255, 106, 4, 104)]
          , Alignment.topLeft
          , Alignment.bottomRight,
          activeScreen=='start-screen' ? Welcome(switchScreen):QuestionsScreen(onSelectAnswer: chooseAnswer))
        ),

      );
  }

  }