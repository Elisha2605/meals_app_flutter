import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title), actions: [
        IconButton(onPressed: () {
          onToggleFavorite(meal);
        }, icon: const Icon(Icons.star, size: 40,))
      ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Ingredians',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.amber),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (meal.ingredients.isNotEmpty)
                  for (final ingredient in meal.ingredients)
                    Column(
                      children: [
                        Text(
                          ingredient,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    )
                else
                  const Text(
                    'No Ingrediens found for this meal...',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Steps',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.amber),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (meal.steps.isNotEmpty)
                  for (final step in meal.steps)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            step,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    )
                else
                  const Text(
                    'No steps found for this meal...',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
