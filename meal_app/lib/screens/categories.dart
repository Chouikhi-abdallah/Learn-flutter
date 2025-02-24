import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen(
    {
      super.key,
      required this.meals
    }
  );
  final List<Meal> meals;


  void _selectCategory(BuildContext context,Category categorie){
    List<Meal> listOfMealByCategory= meals.where((meal) => meal.categories.contains(categorie.id)).toList();
    Navigator.push(context, MaterialPageRoute(builder: (ctx)=> MealsScreen(title: categorie.title, meals: listOfMealByCategory)
    ));
  }
  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: GridView(
        padding:const EdgeInsets.all(24),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        crossAxisSpacing: 20,
        childAspectRatio: 3/2,
        mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category, onPress: () => _selectCategory(context,category),)
          ,
          //availableCategories.map((category)=>CategoryGridItem(category: category))  
        ],),

    );
    
    
  }
  



}