import 'package:flutter/foundation.dart';

import '../data/recipe_repository.dart';
import '../models/recipe.dart';

/// État global des recettes : liste, recherche, filtres et favoris.
class RecipeProvider extends ChangeNotifier {
  RecipeProvider({RecipeRepository? repository})
    : _repository = repository ?? RecipeRepository() {
    loadRecipes();
  }

  final RecipeRepository _repository;

  List<Recipe> _allRecipes = [];
  List<Recipe> _filteredRecipes = [];
  String _searchQuery = '';
  String _selectedCategory = 'All';
  String _timeFilter = 'All';
  int? _rateFilter;
  bool _isLoading = true;
  String? _error;

  List<Recipe> get allRecipes => List.unmodifiable(_allRecipes);
  List<Recipe> get filteredRecipes => List.unmodifiable(_filteredRecipes);
  List<Recipe> get favorites =>
      _allRecipes.where((recipe) => recipe.isFavorite).toList(growable: false);
  List<Recipe> get newRecipes => _allRecipes.take(4).toList(growable: false);
  List<Recipe> get popularRecipes =>
      _allRecipes.where((r) => r.rating >= 3.5).take(6).toList(growable: false);

  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;
  String get timeFilter => _timeFilter;
  int? get rateFilter => _rateFilter;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<String> get categories => _repository.categories;

  Future<void> loadRecipes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _allRecipes = await _repository.getAll();
      _applyFilters();
    } catch (e) {
      _error = 'Impossible de charger les recettes.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    _applyFilters();
    notifyListeners();
  }

  void applyAdvancedFilters({
    required String timeFilter,
    int? rateFilter,
    String? category,
  }) {
    _timeFilter = timeFilter;
    _rateFilter = rateFilter;
    if (category != null) {
      _selectedCategory = category;
    }
    _applyFilters();
    notifyListeners();
  }

  void clearAdvancedFilters() {
    _timeFilter = 'All';
    _rateFilter = null;
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    Iterable<Recipe> results = _allRecipes;

    if (_selectedCategory != 'All') {
      results = results.where((r) => r.category == _selectedCategory);
    }

    if (_searchQuery.trim().isNotEmpty) {
      final q = _searchQuery.trim().toLowerCase();
      results = results.where((r) => r.title.toLowerCase().contains(q));
    }

    if (_rateFilter != null) {
      results = results.where((r) => r.rating.round() == _rateFilter);
    }

    var list = results.toList();
    switch (_timeFilter) {
      case 'Newest':
        list = list.reversed.toList();
      case 'Oldest':
        break;
      case 'Popularity':
        list.sort((a, b) => b.rating.compareTo(a.rating));
      default:
        break;
    }

    _filteredRecipes = list;
  }

  Recipe? getById(String id) {
    try {
      return _allRecipes.firstWhere((recipe) => recipe.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> toggleFavorite(String id) async {
    await _repository.toggleFavorite(id);
    final index = _allRecipes.indexWhere((r) => r.id == id);
    if (index != -1) {
      final recipe = _allRecipes[index];
      _allRecipes[index] = recipe.copyWith(isFavorite: !recipe.isFavorite);
      _applyFilters();
      notifyListeners();
    }
  }

  Future<void> addRecipe({
    required String title,
    required String category,
    required int duration,
    required String difficulty,
    String description = '',
    List<String> ingredients = const [],
  }) async {
    final recipe = Recipe(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      imageUrl: 'assets/images/recipe_3.jpg',
      category: category,
      duration: duration,
      difficulty: difficulty,
      description: description,
      rating: 0,
      reviewCount: '0',
      authorName: 'You',
      authorImageUrl: 'assets/images/avatar.png',
      authorLocation: 'Home',
      ingredients: ingredients
          .where((line) => line.trim().isNotEmpty)
          .map((line) => Ingredient(name: line.trim(), amount: ''))
          .toList(),
      steps: description.isEmpty
          ? const ['No steps provided yet.']
          : description.split('\n').where((s) => s.trim().isNotEmpty).toList(),
    );
    await _repository.addRecipe(recipe);
    _allRecipes.insert(0, recipe);
    _applyFilters();
    notifyListeners();
  }
}
