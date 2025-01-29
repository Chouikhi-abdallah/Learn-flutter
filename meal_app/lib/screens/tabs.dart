import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class Tabs extends StatefulWidget{
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabsState();
   
  }
  
}

class _TabsState extends State<Tabs>{
  int _selectedPageIndex=0;
   List<Meal> _favouriteMeals=[];

   void _showMessage(String message){

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: 
    Text(message)));


   }

  void _toggleFavouriteMealStatus(Meal meal){
    if(_favouriteMeals.contains(meal)){
      _favouriteMeals.remove(meal);
      _showMessage('The ${meal.title} is no longer a favourite');
    }
    else{
      _favouriteMeals.add(meal);
      _showMessage('The ${meal.title} is a favourite');

    }
    setState(() {
      _favouriteMeals=_favouriteMeals;
    });


  }

  void _selectPage(int index){

    setState(() {
      _selectedPageIndex=index;
    });
  }

  void _selectScreenBasedOnString(String str){
   if (str == 'Filters'){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Filters()));
   }
   else{
    Navigator.of(context).pop();
   }
  }

  @override
  Widget build(BuildContext context) {

    print(_favouriteMeals);

    Widget activePageScreen= CategoriesScreen(onToggleFavoutire: _toggleFavouriteMealStatus,);
    var activePageTitle='Categories';

    if(_selectedPageIndex==1){
      activePageScreen=MealsScreen(meals: _favouriteMeals,onToggleFavourite: _toggleFavouriteMealStatus,);
      activePageTitle='Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle
        ),
      ),
      drawer:  MainDrawer(ScreeeNavigation: _selectScreenBasedOnString,),
      body:activePageScreen,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
           BottomNavigationBarItem(icon: Icon(Icons.set_meal_sharp),label: 'Categories'),
           BottomNavigationBarItem(icon: Icon(Icons.star),label:'Favourite'),
        ],
        currentIndex: _selectedPageIndex,

        onTap: (index){
          _selectPage(index);


        },),

    );

  }
  
}