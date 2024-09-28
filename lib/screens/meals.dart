import "package:flutter/material.dart";
import "package:meals_app/models/meal.dart";
import "package:meals_app/screens/meal_detail.dart";
import "package:meals_app/widgets/meal_item.dart";

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      this.selectedPageIndex = 0,
      required this.meals,
      required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final int selectedPageIndex;
  final void Function(Meal meal) onToggleFavorite;

  void onSelectMeal(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealDetailScreen(
                  meal: meal,
                  onToggleFavorite: onToggleFavorite,
                )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          'Oh oh! nothing here...',
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Try selecting a different category!',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        )
      ]),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                onSelectMeal: (meal) {
                  onSelectMeal(context, meal);
                },
                onToggleFavorite: onToggleFavorite,
                showDeleteButton: selectedPageIndex == 1 ? true : false,
              ));
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
