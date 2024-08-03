


import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/styled_text.dart';

class Welcome extends StatelessWidget{
  final void Function() startQuiz;
   const Welcome(this.startQuiz,{super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:MainAxisSize.min ,
      children: [

        Image.asset('assets/images/quiz-logo.png',
        width:200,
        color:const Color.fromARGB(155, 255, 255, 255) ,
        ),
        const SizedBox(height:40),
        const StyledText('Learn Flutter the fun way!',24),
        const SizedBox(height:40),
        OutlinedButton.icon(onPressed: (){startQuiz();} ,icon: const Icon(Icons.arrow_right_alt_sharp),style:OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          

        ) ,label:const StyledText('Start Quizz',15))

      ],
    )

    ;
  }
}