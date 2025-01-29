
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:meal_app/main.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{
  final Function(Meal meal) onToggleFavourite;

  const MealsScreen({super.key,  this.title,required this.meals,required this.onToggleFavourite});

  final String ?title;
  final List<Meal> meals;
  


  @override
  Widget build(BuildContext context) {
    Widget content= ListView.builder(itemCount: meals.length,itemBuilder: (cxt,index)=>
   
      MealItem(mealItem: meals[index],onToggleFavourite: onToggleFavourite,),
     
      );
      

    if(meals.isEmpty){
      content= Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Uh oh ..... Nothing here",
            style:Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Try choosing another category',style:Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)
              
            )
          ],
        ),
      );

    }
    if (title == null){
      return content;
    }
    return Scaffold(
      appBar: AppBar(title:Text(title!)),
      body:content
      


    );
  }
  
}