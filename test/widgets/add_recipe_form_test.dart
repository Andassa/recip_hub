import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/data/recipe_repository.dart';
import 'package:recipe_hub/providers/recipe_provider.dart';
import 'package:recipe_hub/screens/add_recipe_screen.dart';

import '../helpers/test_recipes.dart';

void main() {
  testWidgets('AddRecipeScreen shows validation errors for empty form', (
    tester,
  ) async {
    final view = tester.view;
    view.physicalSize = const Size(1080, 2400);
    view.devicePixelRatio = 1;
    addTearDown(view.resetPhysicalSize);
    addTearDown(view.resetDevicePixelRatio);

    final repository = RecipeRepository(
      initialRecipes: buildTestRecipes(),
      latency: Duration.zero,
    );
    final provider = RecipeProvider(repository: repository);
    await provider.loadRecipes();

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: provider,
        child: const MaterialApp(home: AddRecipeScreen()),
      ),
    );

    expect(find.text('Add Recipe'), findsOneWidget);
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Category'), findsOneWidget);
    expect(find.text('Duration (minutes)'), findsOneWidget);

    final saveFinder = find.text('Save Recipe');
    await tester.ensureVisible(saveFinder);
    await tester.tap(saveFinder);
    await tester.pumpAndSettle();

    expect(find.text('Title must be at least 3 characters'), findsOneWidget);
    expect(find.text('Category is required'), findsOneWidget);
    expect(find.text('Duration is required'), findsOneWidget);

    provider.dispose();
  });
}
