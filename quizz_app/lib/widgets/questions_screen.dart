

import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});
  
  @override
  State<QuestionsScreen> createState() {

    return _QuestionScreenState();



  }



  
}

class _QuestionScreenState extends State<QuestionsScreen>{
  @override
  Widget build(BuildContext context) {
   return SizedBox(
    width: double.infinity,
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('some question ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 23,
        ),),
        const SizedBox(height:20),
        ElevatedButton(onPressed: (){}, child: const Text('some answer')),
        const SizedBox(height:20),
        ElevatedButton(onPressed: (){}, child: const Text('some answer')),
        const SizedBox(height:20),
        ElevatedButton(onPressed: (){}, child: const Text('some answer')),
        const SizedBox(height:20),
        ElevatedButton(onPressed: (){}, child: const Text('some answer'))      
      ],
     ),
   );
  }

  
}