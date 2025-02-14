import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filter_provider.dart';




class Filters extends ConsumerWidget{
   const Filters({
  super.key,
  });


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters=ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: 
        Column(
          children: [
            SwitchListTile(
              value: activeFilters[FiltersToBeUsed.glutenFree]!,
              onChanged: (bool isChecked) {
                ref.read(filtersProvider.notifier).setFilter(FiltersToBeUsed.glutenFree, isChecked);
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only includes gluten Free Meals',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[FiltersToBeUsed.lactoseFree]!,
              onChanged: (bool isChecked) {
                ref.read(filtersProvider.notifier).setFilter(FiltersToBeUsed.lactoseFree, isChecked);
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only includes Lactose Free Meals',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[FiltersToBeUsed.vegetarian]!,
              onChanged: (bool isChecked) {
                ref.read(filtersProvider.notifier).setFilter(FiltersToBeUsed.vegan, isChecked);
              },
              title: Text(
                'Vegetarian meals',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only includes Vegetarian Meals',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[FiltersToBeUsed.vegan]!,
              onChanged: (bool isChecked) {
                ref.read(filtersProvider.notifier).setFilter(FiltersToBeUsed.vegan, isChecked);
              },
              title: Text(
                'Vegan Meals',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only includes Vegan Meals',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      );
    
  }
}


