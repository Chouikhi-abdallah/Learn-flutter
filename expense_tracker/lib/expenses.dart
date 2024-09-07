
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './models/expense.dart';

class Expenses extends StatefulWidget{ 

  const Expenses({super.key});
  
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
  
}

class _ExpensesState extends State<Expenses>{
  final List<Expense> _registredExpenses=[
    Expense(title: 'Mac burger', date: DateTime.now(), amount: 19.99, category: MyCategory.food),
    Expense(title: 'Flutter Course', date: DateTime.now(), amount: 49.55, category: MyCategory.work),
    Expense(title: 'Playing ps 4', date: DateTime.now(), amount: 4.5, category: MyCategory.leisure),
    Expense(title: 'Switzerland travel', date: DateTime.now(), amount: 450, category: MyCategory.travel),
  ];
  void _openModalBottomSheet(){
showModalBottomSheet(context: context, builder:(ctx)=> NewExpense(addExpenseParams: _addExpense),
isScrollControlled: true,

);
 }
 void _addExpense(Expense expense){
  setState(() {
    _registredExpenses.add(expense);
  });
 }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:  Text('Expense Tracker',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
        actions:  [
               IconButton(onPressed:_openModalBottomSheet,
                icon: const Icon(Icons.add),
                 iconSize:40,
                 color: Colors.white),   
        ],


      ),
      
      body:Column(
        
        children: [
          Text('The Charts',
          style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
         
          Expanded(child: ExpensesList(listExp: _registredExpenses))
        ],
      )
      
    );
    
  }
  
}