

import 'package:flutter/material.dart';

class StyledText extends StatelessWidget{
  final String text;
  final double sizeOfFont; 
  const StyledText(this.text,this.sizeOfFont,{super.key});

  
  @override
  
  Widget build(BuildContext context) {

    return Text(text,style:  TextStyle(
      color: Colors.white,
      fontSize: sizeOfFont,
    ),
     
    );

   
  }
}