import 'package:flutter/material.dart';

class Category {
   final String title;
   final Color color;

   const Category({ required this.title, required this.color});

}

enum Categories{
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}