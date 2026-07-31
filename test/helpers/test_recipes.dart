import 'package:recipe_hub/models/recipe.dart';

/// Recettes minimales pour les tests (pas de dépendance aux assets mock).
List<Recipe> buildTestRecipes() {
  return [
    const Recipe(
      id: 't1',
      title: 'Greek Salad',
      imageUrl: 'assets/images/recipe_1.jpg',
      category: 'Dinner',
      duration: 15,
      difficulty: 'Easy',
      rating: 4.5,
      reviewCount: '10',
      authorName: 'Tester',
      authorImageUrl: 'assets/images/avatar.png',
      authorLocation: 'Test City',
      ingredients: [Ingredient(name: 'Tomato', amount: '2')],
      steps: ['Chop', 'Mix'],
      isFavorite: true,
    ),
    const Recipe(
      id: 't2',
      title: 'Pasta Carbonara',
      imageUrl: 'assets/images/recipe_2.jpg',
      category: 'Italian',
      duration: 25,
      difficulty: 'Medium',
      rating: 4.0,
      reviewCount: '5',
      authorName: 'Tester',
      authorImageUrl: 'assets/images/avatar.png',
      authorLocation: 'Test City',
      ingredients: [Ingredient(name: 'Pasta', amount: '200g')],
      steps: ['Boil', 'Sauce'],
    ),
    const Recipe(
      id: 't3',
      title: 'Fruit Bowl',
      imageUrl: 'assets/images/recipe_3.jpg',
      category: 'Breakfast',
      duration: 5,
      difficulty: 'Easy',
      rating: 3.5,
      reviewCount: '2',
      authorName: 'Tester',
      authorImageUrl: 'assets/images/avatar.png',
      authorLocation: 'Test City',
      ingredients: [Ingredient(name: 'Banana', amount: '1')],
      steps: ['Slice'],
    ),
  ];
}
