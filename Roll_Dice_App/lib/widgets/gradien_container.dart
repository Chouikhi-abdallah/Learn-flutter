
import 'package:flutter/material.dart';
import './dice_roller.dart';
//import './styled_text.dart';

// This are variables of type alignmenet, or we can type var or dynamic;
const  startAlignment=Alignment.topLeft;
const  endAlignement=Alignment.bottomRight;

class GradienContainer extends StatelessWidget{
  final List<Color> colors;
  const GradienContainer(this.colors,{super.key});

  
  
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration( 
      gradient: 
      LinearGradient(
        colors:colors,
        begin:startAlignment,
        end: endAlignement, 
        ),
        ),
    child: const Center(
      child:DiceRoller(),

    ),
    );
    
  }


 


}