import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_hub/data/recipe_repository.dart';
import 'package:recipe_hub/providers/recipe_provider.dart';

import '../helpers/test_recipes.dart';

void main() {
  late RecipeProvider provider;

  setUp(() async {
    final repository = RecipeRepository(
      initialRecipes: buildTestRecipes(),
      latency: Duration.zero,
    );
    provider = RecipeProvider(repository: repository);
    await provider.loadRecipes();
  });

  tearDown(() {
    provider.dispose();
  });

  test('loadRecipes populates list and clears loading', () {
    expect(provider.isLoading, isFalse);
    expect(provider.allRecipes, hasLength(3));
    expect(provider.error, isNull);
  });

  test('setSearchQuery filters by title', () {
    provider.setSearchQuery('fruit');
    expect(provider.filteredRecipes, hasLength(1));
    expect(provider.filteredRecipes.first.title, 'Fruit Bowl');
  });

  test('setCategory filters by category', () {
    provider.setCategory('Italian');
    expect(provider.filteredRecipes, hasLength(1));
    expect(provider.filteredRecipes.first.id, 't2');
  });

  test('favorites returns only favorite recipes', () {
    expect(provider.favorites, hasLength(1));
    expect(provider.favorites.first.id, 't1');
  });

  test('toggleFavorite updates favorites list', () async {
    await provider.toggleFavorite('t2');
    expect(provider.favorites.map((r) => r.id), containsAll(['t1', 't2']));
  });

  test('addRecipe prepends a new recipe', () async {
    await provider.addRecipe(
      title: 'Soup',
      category: 'Dinner',
      duration: 30,
      difficulty: 'Easy',
      description: 'Boil water\nAdd veggies',
      ingredients: ['Water', 'Carrot'],
    );
    expect(provider.allRecipes, hasLength(4));
    expect(provider.allRecipes.first.title, 'Soup');
  });

  test('getById returns recipe from provider cache', () {
    expect(provider.getById('t3')?.title, 'Fruit Bowl');
    expect(provider.getById('nope'), isNull);
  });
}
