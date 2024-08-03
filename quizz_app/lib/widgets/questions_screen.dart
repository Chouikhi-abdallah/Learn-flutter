

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
        const Text('abdallah msatka wlla '),
        const SizedBox(height:20),
        ElevatedButton(onPressed: (){}, child: const Text('ay')),
        const SizedBox(height:20),
        ElevatedButton(onPressed: (){}, child: const Text('laaa')),
        const SizedBox(height:20),
        ElevatedButton(onPressed: (){}, child: const Text('chway chway')),
        const SizedBox(height:20),
        ElevatedButton(onPressed: (){}, child: const Text('sa3at sa3at'))      
      ],
     ),
   );
  }

  
}