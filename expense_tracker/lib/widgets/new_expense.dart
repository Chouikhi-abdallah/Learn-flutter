
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  final void Function (Expense expense) addExpenseParams;

  const NewExpense({super.key,required this.addExpenseParams});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
   
  }
  

}

class _NewExpenseState extends State<NewExpense>{
  final _titleController=TextEditingController();
  final _amountController=TextEditingController();
  DateTime ? datePicked;
   MyCategory _categoryValue=MyCategory.leisure;
   

  void pickDate() async{
    final DateTime? selectedDate=await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2026));


    setState(() {
      datePicked=selectedDate;
    });
  }
  void _submitExpenseDate(){
    double? entredAmount=double.tryParse(_amountController.text);
    bool amountIsInValid= entredAmount==null || entredAmount<=0;
    String entredCategory=_categoryValue.toString();
    
   if(_titleController.text.trim().isEmpty || amountIsInValid || datePicked.toString().isEmpty || entredCategory.isEmpty){
    showDialog(context: context, builder: (ctx)=> AlertDialog(
      title: const Text('Invalid Form Data'),
      content: const Text('plz enter all the required infos'),
      actions: [
        TextButton(
          child:  const Text('Return'),
          onPressed: () {
            Navigator.pop(ctx);
          },
          
        ),
      ],
    ));

   }
  }
  @override
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 48, 10, 16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 12,
                controller: _amountController,
                decoration: const InputDecoration(
                label: Text('Amount'),
                prefixText: '\$',
                            ),
                          ),
              ),
          const SizedBox(width: 15,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(datePicked == null ? 'No Date selected' : formatter.format(datePicked!)),
                IconButton(onPressed: pickDate,
                icon: const Icon(Icons.calendar_month_outlined))
              ],
              
            ),
          )

            ],
          )
          
          ,
          
          Row(
            children: [
              DropdownButton(
                value: _categoryValue,
                
                items: MyCategory.values.map(
                  
                  (category)=>DropdownMenuItem(value: category,
                  child:Text(category.name.toUpperCase()),)
                ).toList(),
                 onChanged: (value){
                  setState(() {
                    if(value==null) {
                      return ;
                    }
                     _categoryValue=value;
                  });
                  if (kDebugMode) {
                    print(_categoryValue);
                  }
                 }),
              const Spacer(),
               TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child:const Text('Cancel') ),
              ElevatedButton(onPressed: (){
                if (kDebugMode) {
                  _submitExpenseDate();
                  
                  print(_titleController.text);
                  print(_amountController.text);
                  widget.addExpenseParams(Expense(
                    title: _titleController.text,
                    date: datePicked!,
                    amount: double.parse(_amountController.text),
                    category: _categoryValue));
                    Navigator.pop(context);
                }
              }, child: const Text('Save Expense')),
             
            ],
          ),

        ],
      ),
      );
  }
  
}