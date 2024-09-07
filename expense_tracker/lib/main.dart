import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';

var kColorSheme=ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kColorShemeDark=ColorScheme.fromSeed(seedColor: const Color.fromARGB(255,55,55,55),
brightness: Brightness.dark);
void main(){
  runApp(
     MaterialApp(
      darkTheme: ThemeData().copyWith(
        colorScheme:kColorShemeDark,
        cardTheme: const CardTheme().copyWith(
          color: kColorShemeDark.onSecondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8)



        ) 
      ),
      theme:
       ThemeData(
        ).copyWith(
          colorScheme: kColorSheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorSheme.onPrimaryContainer,
            foregroundColor: kColorSheme.onPrimaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorSheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8)
          )
        ),
        themeMode: ThemeMode.system,
      home:const Expenses()
    ),
  );
}