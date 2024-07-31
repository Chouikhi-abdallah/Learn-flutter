
import 'package:first_app/helpers/genrate_random_integers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './styled_text.dart';

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
    
  }
  
}
class _DiceRollerState extends State<DiceRoller>{
  
  int randInt=6;

  void handleButtonClick(){
   if (kDebugMode) {
     print("The button is clicked");
   } 
   setState(() {
    GenrateRandomIntegers randomNumber=GenrateRandomIntegers(1, 6);
    randInt=randomNumber.genrate();
   });
   
  }
  @override
  Widget build(context){

    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/dice-$randInt.png'
,width:200),
          const SizedBox(height: 20,),
          TextButton(onPressed: handleButtonClick, child: const StyledText('Press To Roll'),)
        ],
      );

  }
}