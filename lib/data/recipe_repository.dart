import '../models/recipe.dart';
import 'mock_recipes.dart';

/// Repository local exposant les recettes (mock en mémoire).
class RecipeRepository {
  RecipeRepository({List<Recipe>? initialRecipes})
    : _recipes = List<Recipe>.from(initialRecipes ?? mockRecipes);

  final List<Recipe> _recipes;

  /// Simule un délai réseau pour afficher un loader.
  Future<void> _simulateDelay() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
  }

  Future<List<Recipe>> getAll() async {
    await _simulateDelay();
    return List<Recipe>.unmodifiable(_recipes);
  }

  Future<Recipe?> getById(String id) async {
    await _simulateDelay();
    try {
      return _recipes.firstWhere((recipe) => recipe.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<List<Recipe>> search(String query) async {
    await _simulateDelay();
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) {
      return List<Recipe>.unmodifiable(_recipes);
    }
    return _recipes
        .where((recipe) => recipe.title.toLowerCase().contains(normalized))
        .toList(growable: false);
  }

  Future<List<Recipe>> filterByCategory(String category) async {
    await _simulateDelay();
    if (category == 'All') {
      return List<Recipe>.unmodifiable(_recipes);
    }
    return _recipes
        .where((recipe) => recipe.category == category)
        .toList(growable: false);
  }

  Future<List<Recipe>> getFavorites() async {
    await _simulateDelay();
    return _recipes
        .where((recipe) => recipe.isFavorite)
        .toList(growable: false);
  }

  Future<void> toggleFavorite(String id) async {
    final index = _recipes.indexWhere((recipe) => recipe.id == id);
    if (index == -1) return;
    final recipe = _recipes[index];
    _recipes[index] = recipe.copyWith(isFavorite: !recipe.isFavorite);
  }

  Future<Recipe> addRecipe(Recipe recipe) async {
    _recipes.insert(0, recipe);
    return recipe;
  }

  Future<Recipe> updateRecipe(Recipe recipe) async {
    final index = _recipes.indexWhere((item) => item.id == recipe.id);
    if (index != -1) {
      _recipes[index] = recipe;
    }
    return recipe;
  }

  List<String> get categories => kRecipeCategories;
}
