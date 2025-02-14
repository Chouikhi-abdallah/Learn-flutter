import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/favourite_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends ConsumerWidget{
  final Meal meal;
  

  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final bool isFavourite= ref.watch(favouriteMealProvider).contains(meal);
    return  Scaffold(
      appBar:  AppBar(
        actions: [
          IconButton(onPressed: (){
            final wasAdded=ref
            .read(favouriteMealProvider.notifier)
            .toggleMealFavourite(meal);
             ScaffoldMessenger.of(context).clearSnackBars();
             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(
                wasAdded ? 'the Meals is added as favourite with Riverpod':'the meal is removed from favourites with riverPod'
              ))
             );
          },
           icon:Icon(isFavourite ? Icons.star : Icons.star_border) )
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