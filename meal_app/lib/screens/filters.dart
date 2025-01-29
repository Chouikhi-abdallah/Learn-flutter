import 'package:flutter/material.dart';

class Filters extends StatefulWidget{
  @override
  State<Filters> createState() {

    return FiltersState();
  
  }
  
}

class FiltersState extends State<Filters> {

  bool _isGlutenFree=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
        
      ),
      body: Column(
        children: [
          SwitchListTile(value: _isGlutenFree
          , onChanged:(bool isChecked){
            setState(() {
              _isGlutenFree=isChecked;
            });
          },
          title: Text(
            'Gluten-Free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          subtitle: Text('Only includes gluten Free Meals',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color:Theme.of(context).colorScheme.primary,
          ),),
          activeColor: Theme.of(context).colorScheme.tertiary,
          
          contentPadding:const EdgeInsets.only(
            left:34,
            right:22 ) ,),
          
        ],
      ),
    ); 
  }
}

