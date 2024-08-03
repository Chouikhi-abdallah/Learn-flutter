

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
          [Color.fromRGBO(169, 94, 249, 0.597),Color.fromARGB(255, 165, 66, 240),Color.fromARGB(255, 94, 22, 103)
          ,Color.fromARGB(255, 64, 2, 86),Color.fromARGB(255, 106, 4, 104)]
          , Alignment.topLeft
          , Alignment.bottomRight,
          activeScreen=='start-screen' ? Welcome(switchScreen):const QuestionsScreen())
        ),

      );
  }

  }