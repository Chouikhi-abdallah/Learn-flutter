import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionsSummary extends StatelessWidget{

  final List<Map<String,Object>> summaryData;


  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: summaryData.map((data){
        return Row(
          children: [
            Container(
              
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(5),
              decoration:  const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
                
                
               
               ),


              child: Text(((data['question_index'] as int )+ 1).toString(),
              textAlign: TextAlign.center,
              style:GoogleFonts.poppins(
                fontSize: 25,
                color: Colors.white,
              )
              
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(data['question'] as String,
                  style: GoogleFonts.poppins(color:Colors.white),),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(data['user_answer'] as String,
                  style: GoogleFonts.poppins(
                    color:Colors.green,
                    fontSize: 14,
                  ),),
                  Text(data['correct_answer'] as String,
                  style:GoogleFonts.poppins(
                    fontSize: 14,
                    color:Colors.blueGrey
                  ))
                ],
              ),
            )
          ],

        );

      }).toList()

    );
    
  }
  
}