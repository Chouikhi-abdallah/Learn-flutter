import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{
  final List<Expense> listExp;
   final void Function (Expense expense) onRemove;
  const ExpensesList({super.key,required this.listExp,required this.onRemove});
   
   
     @override
     Widget build(BuildContext context) {
       return (
        ListView.builder(itemCount: listExp.length,
        itemBuilder:(context,index)=>Dismissible(
          key:ValueKey(listExp[index]),
          onDismissed: (direction) {
            onRemove(listExp[index]);
          },
          background: Container(color: Theme.of(context).colorScheme.error,
          margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 8)),
          child: ExpensesItem(expense: listExp[index])))
       );

}
}