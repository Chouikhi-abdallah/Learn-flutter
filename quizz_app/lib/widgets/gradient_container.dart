


import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget{
  final List<Color> colors;
  final  Alignment beginAlignement;
  final Alignment endAlignement;
  final Widget screen;

  const GradientContainer(this.colors,this.beginAlignement,this.endAlignement,this.screen,{super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient:
       LinearGradient(
        colors: colors,
        begin:beginAlignement,
        end:endAlignement,

       )
       ),
      child: Center(
        child: screen,
      ),
    );

  }
  
}