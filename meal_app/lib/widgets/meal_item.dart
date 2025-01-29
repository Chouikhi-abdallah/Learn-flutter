import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget{
const MealItem({super.key, required this.mealItem, required this.onToggleFavourite});
  final Meal mealItem;
  final void Function(Meal meal) onToggleFavourite;


  String get complexityText{
    return mealItem.complexity.name[0].toUpperCase()+mealItem.complexity.name.substring(1);
  }
  String get affordabilityText{
    return mealItem.affordability.name[0].toUpperCase() + mealItem.affordability.name.substring(1);
  }

  void navigateToMealScreen(Meal meal,BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal,onToggleFavourite: onToggleFavourite,)));
  }
  @override
  Widget build(BuildContext context) {


    return  Card(
      margin: const EdgeInsets.all(8),
      shape:RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,


      
      child: InkWell(
        onTap: (){
          navigateToMealScreen(mealItem, context);
        },
        child:Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage),
            fit: BoxFit.cover,
            height:200,
            width:double.infinity,
              image:NetworkImage(mealItem.imageUrl) ),
               Positioned(
                left:0,
                bottom:0,
                right:0,
                top:95,
                child:Container(
                  color: Colors.black54,
                  padding:const EdgeInsets.symmetric(
                    vertical:6,
                    horizontal:44,
                  ),
                  child: Column(
                    children: [
                      Text(mealItem.title,maxLines: 2,
                      textAlign:TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                      const SizedBox(height:12),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: 
                      [
                       MealItemTrait(icon: Icons.schedule, label:"${mealItem.duration} min" ),
                       const SizedBox(width:12),
                       MealItemTrait(icon: Icons.work, label: complexityText),
                       const SizedBox(width:12),
                       MealItemTrait(icon: Icons.attach_money, label:affordabilityText ),




                      ],)




                  ],)
                  

                ),
               )
          ],

        )


      ),
    );


    
  }

  
}