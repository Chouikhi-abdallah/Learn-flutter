import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key,required this.listExp});
   final List<Expense> listExp;
   
     @override
     Widget build(BuildContext context) {
       return (
        ListView.builder(itemCount: listExp.length,itemBuilder:(context,index)=>ExpensesItem(expense: listExp[index]))
       );

}
}