import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

 const uuid=Uuid();

 final formatter=DateFormat.yMd();

  const categoryIcons={
  MyCategory.food:Icons.lunch_dining,
  MyCategory.leisure:Icons.movie,
  MyCategory.work:Icons.work,
  MyCategory.travel:Icons.travel_explore
 };
 

class Expense {
final String id;  
final String title;
final DateTime date;
final double amount;
final MyCategory category;

Expense({
  required this.title,
  required this.date,
  required this.amount, 
  required this.category

} 
) : id=uuid.v4();

String get fromattedDate{
  return formatter.format(date);


}


 
}

enum MyCategory{
 food,travel,leisure,work

}