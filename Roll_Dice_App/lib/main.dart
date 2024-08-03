import 'package:flutter/material.dart';
import './widgets/gradien_container.dart';

void main(){
  runApp(const MaterialApp(
    home:Scaffold(
    body:GradienContainer(
     [
      Color.fromARGB(255, 252, 0, 0),
      Color.fromARGB(255, 241, 89, 89),
      Color.fromARGB(255, 254, 118, 118),
      Color.fromARGB(255, 247, 197, 197)
      ]
      )
        ) 
        )
        );
}

