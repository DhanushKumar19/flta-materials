import 'package:flutter/material.dart';
import 'package:fooderlich/components/recipe_thumbnail.dart';

import 'components.dart';
import 'package:fooderlich/models/models.dart';

class RecipeGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;

  const RecipeGridView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return RecipeThumbnail(recipe: recipes[index],);
          },
        itemCount: recipes.length,
      ),
    );
  }
}
