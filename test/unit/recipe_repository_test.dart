import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_hub/data/recipe_repository.dart';
import 'package:recipe_hub/models/recipe.dart';

import '../helpers/test_recipes.dart';

void main() {
  late RecipeRepository repository;

  setUp(() {
    repository = RecipeRepository(
      initialRecipes: buildTestRecipes(),
      latency: Duration.zero,
    );
  });

  test('getAll returns all recipes', () async {
    final all = await repository.getAll();
    expect(all, hasLength(3));
  });

  test('getById returns matching recipe', () async {
    final recipe = await repository.getById('t1');
    expect(recipe, isNotNull);
    expect(recipe!.title, 'Greek Salad');
  });

  test('getById returns null for unknown id', () async {
    expect(await repository.getById('missing'), isNull);
  });

  test('search filters by title', () async {
    final results = await repository.search('pasta');
    expect(results, hasLength(1));
    expect(results.first.id, 't2');
  });

  test('filterByCategory returns category matches', () async {
    final dinner = await repository.filterByCategory('Dinner');
    expect(dinner, hasLength(1));
    expect(dinner.first.id, 't1');
  });

  test('toggleFavorite flips favorite flag', () async {
    await repository.toggleFavorite('t2');
    final recipe = await repository.getById('t2');
    expect(recipe!.isFavorite, isTrue);
  });

  test('addRecipe inserts at the beginning', () async {
    final created = await repository.addRecipe(
      const Recipe(
        id: 'new',
        title: 'New Dish',
        imageUrl: 'assets/images/recipe_1.jpg',
        category: 'Lunch',
        duration: 10,
        difficulty: 'Easy',
        rating: 0,
        reviewCount: '0',
        authorName: 'You',
        authorImageUrl: 'assets/images/avatar.png',
        authorLocation: 'Home',
        ingredients: [],
        steps: ['Step'],
      ),
    );
    expect(created.id, 'new');
    final all = await repository.getAll();
    expect(all.first.id, 'new');
    expect(all, hasLength(4));
  });
}
