import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesMealScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;

  FavoritesMealScreen(this.favoritedMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritedMeals.isEmpty) {
      return Center(
        child: Text("You have no favorites yet - start to adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoritedMeals[index].id,
            title: favoritedMeals[index].title,
            imageUrl: favoritedMeals[index].imageUrl,
            duration: favoritedMeals[index].duration,
            complexity: favoritedMeals[index].complexity,
            affordability: favoritedMeals[index].affordability,
          );
        },
        itemCount: favoritedMeals.length,
      );
    }
  }
}
