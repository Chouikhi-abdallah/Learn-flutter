import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favourite_provider.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/providers/filter_provider.dart';


class Tabs extends ConsumerStatefulWidget{
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() {
    return _TabsState();
   
  }
  
}

class _TabsState extends ConsumerState<Tabs>{
  int _selectedPageIndex=0;
   


  

  void _selectPage(int index){

    setState(() {
      _selectedPageIndex=index;
    });
  }

  void _selectScreenBasedOnString(String str) async {
    Navigator.of(context).pop();
    if (str == 'Filters') {
      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const Filters(),
        ),
      );
      if (result != null) {
        ref.read(filtersProvider.notifier).setFilters(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final filterdMeals=ref.watch(filteredMealsProvider);


    Widget activePageScreen= CategoriesScreen( meals: filterdMeals,);
    var activePageTitle='Categories';

    if(_selectedPageIndex==1){
      final favouriteMeal=ref.watch(favouriteMealProvider);
      activePageScreen=MealsScreen(meals: favouriteMeal);
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