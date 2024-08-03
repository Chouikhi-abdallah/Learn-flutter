

import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/gradient_container.dart';
import 'package:quizz_app/widgets/questions_screen.dart';
import 'package:quizz_app/widgets/welcome.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});






  @override
  State<Quiz> createState() {
   return _QuizState();
  }
  }


  class _QuizState extends State<Quiz>{
   String? activeScreen='start-screen';




   void switchScreen(){
    setState(() {
      activeScreen='quiz-screen';
    });
   } 



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      Scaffold(
        body:GradientContainer(const 
          [Color.fromARGB(255, 11, 13, 135),Color.fromARGB(255, 36, 39, 166),Color.fromARGB(255, 56, 58, 199)
          ,Color.fromARGB(255, 81, 83, 186),Color.fromARGB(255, 28, 53, 152)]
          , Alignment.topLeft
          , Alignment.bottomRight,
          activeScreen=='start-screen' ? Welcome(switchScreen):const QuestionsScreen())
        ),

      );
  }

  }