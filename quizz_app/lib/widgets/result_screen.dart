
import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/widgets/questions_summary.dart';
import 'package:quizz_app/widgets/styled_text.dart';

class ResultScreen extends StatelessWidget{
  final List<String> answers;
final void Function() func;
  const ResultScreen({super.key, required this.answers,required this.func});
  

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary=[];

    for(var i=0;i<answers.length;i++){
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':answers[i]
      });
    }

   
    return summary;
  }
  
  @override
  Widget build(BuildContext context) {
    final numTotalQuestion=questions.length;
    final numTotalCorrect=getSummaryData().where((data){
      return data['correct_answer']==data['user_answer'];
    }).length;


    return  SizedBox(
      width:  double.infinity,
      child:Container(
        margin: const EdgeInsets.all(40),
        child:  SizedBox(
          height:300,
          child: SingleChildScrollView(
            child: Column(
              
              children: [
                 StyledText("You answer $numTotalCorrect question out of $numTotalQuestion", 30,
                ),
                const SizedBox(
                  height:30,
                ),
                QuestionsSummary(summaryData: getSummaryData()),
                const SizedBox(
                  height:30,
                ),
              OutlinedButton.icon(onPressed: (){
                func();
              } ,icon: const Icon(Icons.refresh_rounded),style:OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
          

        ) ,label:const StyledText('Restart Quizz',15))
            
            
            
              ],
              ),
          ),
        ),
      )
    );
    
  }


}