

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ExpensesItem extends StatelessWidget{
  final Expense expense;

  const ExpensesItem({super.key,required this.expense});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding:  const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 14
        ),
        child: Column(children: [
        Text(expense.title,
        style: GoogleFonts.poppins(
          fontSize: 17,
          color: Colors.purple,
        ),),
        const SizedBox(
          height:4
        ),
        Row(
          children: [
            Text('\$${expense.amount}',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.black,
            ),),
            const Spacer(flex: 3,

            ),
            Row(
              children: [
                
                Icon(categoryIcons[expense.category],
                color: Colors.black),
                const SizedBox(width: 10),

                
                Text(expense.fromattedDate,
                style: const TextStyle(color: Colors.black),)        
              ],
            ),
          ],
        ),
        

        ],),
      ),
    );
  }


  
}