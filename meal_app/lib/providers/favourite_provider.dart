import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavouriteMealNotifier extends  StateNotifier<List<Meal>>{
  FavouriteMealNotifier():super([]);

  bool toggleMealFavourite(Meal meal){
    final isFavourite=state.contains(meal);

    if(isFavourite){
      state=state.where((m)=>m.id!=meal.id).toList();
      return false;
    }
    else{
      final temp=[...state];
      temp.add(meal);
      state=temp;
      return true;
      // or simply state = [...state,meal]
    }
  }

}

final favouriteMealProvider=StateNotifierProvider<FavouriteMealNotifier,List<Meal>>((ref){
  return FavouriteMealNotifier();

});