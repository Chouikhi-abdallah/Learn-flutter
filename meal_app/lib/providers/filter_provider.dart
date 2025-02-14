import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meals_provider.dart';

enum FiltersToBeUsed {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<FiltersToBeUsed, bool>> {
  FiltersNotifier()
      : super({
          FiltersToBeUsed.glutenFree: false,
          FiltersToBeUsed.lactoseFree: false,
          FiltersToBeUsed.vegetarian: false,
          FiltersToBeUsed.vegan: false,
        });

  void setFilters(Map<FiltersToBeUsed, bool> currentFilters) {
    state = currentFilters;
  }

  void setFilter(FiltersToBeUsed filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<FiltersToBeUsed, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider=Provider((ref){
  final meals=ref.watch(mealsProvider);
  final activeFilters=ref.watch(filtersProvider);

  return meals.where((meal) {
      if (activeFilters[FiltersToBeUsed.glutenFree]!&& !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[FiltersToBeUsed.lactoseFree]!&&!meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[FiltersToBeUsed.vegetarian]!&& !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[FiltersToBeUsed.vegan]!&& !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
 
});