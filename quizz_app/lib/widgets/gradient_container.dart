
// this is package will be impoted in the quiz.dart file

import 'package:flutter/material.dart'; // import the material package of google Material design

class GradientContainer extends StatelessWidget{ // this is a stateless widget that will be used to create a container with a gradient background ans no state changes
  final List<Color> colors; // this is a list of colors that will be used to create the gradient
  final  Alignment beginAlignement; // this is the alignment of the gradient at the beginning
  final Alignment endAlignement; // this is the alignment of the gradient at the end
  final Widget screen;// this is the widget that will be displayed on the screen

  const GradientContainer(this.colors,this.beginAlignement,this.endAlignement,this.screen,{super.key});
  @override
  Widget build(BuildContext context) { // this is the function that will build the widget
    return Container( // a container is a widget that can contain other widgets
      decoration: BoxDecoration(gradient:
       LinearGradient(
        colors: colors,
        begin:beginAlignement,
        end:endAlignement,

       )
       ),
      child: Center(
        child: screen, // this is a passed as a parameter to the widget
      ),
    );

  }
}

/*
As a conclusion this a widget that has a container with a box decoration which 
allow as to create a gradient background and a child widget that will be displayed on the screen
and all passed as parameters to the widget
to make this widget reusable 
*/