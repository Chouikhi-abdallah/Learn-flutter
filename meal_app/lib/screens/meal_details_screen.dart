import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget{
  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;
  

  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavourite
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        actions: [
          IconButton(onPressed: (){
            onToggleFavourite(meal);
          },
           icon:const Icon(Icons.star) )
        ],
        title: Text(meal.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              
            ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height:12
            ),
            FadeInImage(placeholder: MemoryImage(kTransparentImage),
                fit: BoxFit.cover,
                height:300,
                width:double.infinity,
                  image:NetworkImage(meal.imageUrl) ),
           const SizedBox(
            height: 12,
           ),
           Text('Ingredients',
           style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold
           ),
           ) ,
           const SizedBox(
            height:12,
           ),
           for(String ingredient in meal.ingredients)
            Text(ingredient,
           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
           ),
           
           ),
           const SizedBox(
            height:12
           ),
           Text('Steps',
           style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
           ),
           ) ,
           const SizedBox(
            height:12,
           ),
           for(int i=0;i<meal.steps.length;i++)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12
              ),
              child: Text("$i-${meal.steps[i]}",
              textAlign: TextAlign.left,
                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              
                       ),
                       ),
            )  
                  
        
          ],
        
        
        ),
      ),
    );
  }




}