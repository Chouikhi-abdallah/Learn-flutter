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

class ExpenseBucket{
  final MyCategory category;
  final List<Expense> expenses;
  ExpenseBucket({required this.category,required this.expenses});

  // ignore: unrelated_type_equality_checks
  ExpenseBucket.forCategory(List<Expense> allExpanses,this.category):expenses=allExpanses.where((e)=>e.category==category).toList();

  get totalExpenses{
    double ans=0;
    for( Expense i in expenses){
      ans+=i.amount;

    }
    return ans;
  }
}

enum MyCategory{
 food,travel,leisure,work

}