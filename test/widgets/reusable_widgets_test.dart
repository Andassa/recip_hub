import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_hub/widgets/category_chip.dart';
import 'package:recipe_hub/widgets/difficulty_badge.dart';
import 'package:recipe_hub/widgets/recipe_card.dart';
import 'package:recipe_hub/widgets/search_bar_widget.dart';

import '../helpers/l10n_harness.dart';
import '../helpers/test_recipes.dart';

/// Vérifie la présence d'au moins 3 widgets réutilisables dans widgets/.
void main() {
  testWidgets('reusable widgets render without hardcoded recipe lists', (
    tester,
  ) async {
    final recipe = buildTestRecipes().first;
    var cardTapped = false;

    await tester.pumpWidget(
      wrapWithL10n(
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SearchBarWidget(hintText: 'Search recipe'),
                CategoryChip(
                  label: recipe.category,
                  isSelected: false,
                  onTap: () {},
                ),
                DifficultyBadge(difficulty: recipe.difficulty),
                SizedBox(
                  height: 180,
                  child: RecipeCard(
                    recipe: recipe,
                    onTap: () => cardTapped = true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.byType(SearchBarWidget), findsOneWidget);
    expect(find.byType(CategoryChip), findsOneWidget);
    expect(find.byType(DifficultyBadge), findsOneWidget);
    expect(find.byType(RecipeCard), findsOneWidget);
    expect(find.byType(Stack), findsWidgets);
    expect(find.byType(Hero), findsOneWidget);

    await tester.tap(find.byType(RecipeCard));
    expect(cardTapped, isTrue);
  });
}
