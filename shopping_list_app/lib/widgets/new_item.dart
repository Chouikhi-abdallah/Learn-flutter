//import 'dart:math';

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/category.dart';
//import 'package:shopping_list_app/models/grocery_item.dart';
import'package:http/http.dart' as http;
import 'package:shopping_list_app/models/grocery_item.dart';


class NewItem extends StatefulWidget{
  const NewItem({super.key});
  
  
  @override
  State<NewItem> createState() {
    return NewItemState();
  
  }
  
}

class NewItemState extends State<NewItem>{
  final _formKey=GlobalKey<FormState>();
  var _entredName="";
  var _entredQuantity=1;
  var _selectedCategory=categories[Categories.vegetables]!;
  bool isSaving=true;

  void _saveItem() async{
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      setState(() {
        isSaving=false;
      });
      final response=await http.post(Uri.https('flutter-212ba-default-rtdb.firebaseio.com','shopping-list.json'),
      headers: {
        'Content-Type':'application/json',
      },
      body: jsonEncode({
        'title':_entredName,
        'quantity':_entredQuantity,
        'category':_selectedCategory.title,
      }));
      print(response.body);
      print(response.statusCode);

      if (!context.mounted){
        return ;
      }
      final resData=jsonDecode(response.body);
      Navigator.of(context).pop<GroceryItem>(
        GroceryItem(id: resData["name"], name: _entredName, quantity: _entredQuantity, category: _selectedCategory)
      );
      
     
      if(kDebugMode){
      print(_entredName);
      print(_entredQuantity);
      print(_selectedCategory);
      }

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Plz Enter valid Info')));
    }

  }

  void _resetItem(){
    _formKey.currentState!.reset();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Item'),
      ),
      body: Padding(padding: EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
        children: [
          TextFormField(
            onSaved: (newValue)
             { _entredName=newValue!;},
            maxLength: 50,
            keyboardAppearance: Brightness.dark,
            validator: (value){
              if(value == null ||
               value.isEmpty ||
                value.trim().length<=1 || 
                value.trim().length>50) {
                return "The Title should be a string with length between 1 and 50";
              }
                return null;
            },
            decoration: InputDecoration(
              
              icon: Icon(Icons.title),
              labelText: "Please enter the title of the new item",

              

            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
            child: TextFormField(
              onSaved: (value){
                _entredQuantity=int.tryParse(value!)!;
              },
              validator: (value){
                if(value == null ||
                  value.isEmpty ||
                  int.tryParse(value) == null || 
                  int.tryParse(value)!<=0) {
                  return "The Quantity Should be a positive non empty number";
                }
                return null;
              },
              keyboardType:TextInputType.number,
              decoration: InputDecoration(
                    icon: Icon(Icons.numbers),
                    label: Text('Quantity'),
                    
                    
                  ),
                  initialValue: _entredQuantity.toString(),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: DropdownButtonFormField(
                  value: _selectedCategory,
                  onChanged:(value) {
                    setState(() {
                      _selectedCategory=value!;
                    });
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.category)
                  ),
                  items:[
                    for(final category in categories.entries )
                    DropdownMenuItem(
                      value: category.value,
                      child: Row(
                        children: [
                          Container(
                            height:16,
                            width:16,
                            color: category.value.color,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(category.value.title)
                        ],
                
                      ),
                      )
                
                  ],
                  
                ),
              )
            ],
          ),
          const SizedBox(
            height:20
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: _resetItem, child: Text('Reset')),
              ElevatedButton(onPressed: !isSaving ? null :_saveItem, child: Text('Add Item'))
            ],
          )

        ],
      )
      ),
      ),



    );
  }
  
}