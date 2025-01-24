
import 'package:expense_tracker/widgets/charts/chart.dart';
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
useSafeArea: true,

);
 }
 void _addExpense(Expense expense){
  setState(() {
    _registredExpenses.add(expense);
  });
 }
void _removeExpense(Expense expense){
     int indexOfRemovedElement = _registredExpenses.indexOf(expense);

  setState(() {
    _registredExpenses.remove(expense);
  });
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
      duration: const Duration(seconds: 4),
      content: const Text('Removed succefully'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: (){
          setState(() {
            _registredExpenses.insert(indexOfRemovedElement,expense);
          });

        }),
      )
      );
 }
  @override
  Widget build(BuildContext context) {

    final width= MediaQuery.of(context).size.width;
    Widget mainContent=Center(child: ExpensesList(listExp: _registredExpenses,onRemove: _removeExpense,));

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
      
      body:width<600 ?Column(
        
        children: [
         
          Chart(expenses: _registredExpenses)
          ,Expanded(
            child: _registredExpenses.isNotEmpty ? mainContent : const Center(child:  Text("No Expenses found add Some")) )
        ],
      ) :
      Row(
        children: [
          Expanded(child: Chart(expenses: _registredExpenses))
          ,Expanded(
            child: _registredExpenses.isNotEmpty ? mainContent : const Center(child:  Text("No Expenses found add Some")) )
        ],
      )
      
    );
    
  }
  
}