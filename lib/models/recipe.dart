class Recipe {
  const Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.duration,
    required this.difficulty,
    required this.ingredients,
    required this.steps,
    required this.rating,
    required this.reviewCount,
    required this.authorName,
    required this.authorImageUrl,
    required this.authorLocation,
    this.description = '',
    this.isFavorite = false,
    this.servings = 1,
  });

  final String id;
  final String title;
  final String imageUrl;
  final String category;
  final int duration;
  final String difficulty;
  final List<Ingredient> ingredients;
  final List<String> steps;
  final double rating;
  final String reviewCount;
  final String authorName;
  final String authorImageUrl;
  final String authorLocation;
  final String description;
  final bool isFavorite;
  final int servings;

  Recipe copyWith({
    String? id,
    String? title,
    String? imageUrl,
    String? category,
    int? duration,
    String? difficulty,
    List<Ingredient>? ingredients,
    List<String>? steps,
    double? rating,
    String? reviewCount,
    String? authorName,
    String? authorImageUrl,
    String? authorLocation,
    String? description,
    bool? isFavorite,
    int? servings,
  }) {
    return Recipe(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      duration: duration ?? this.duration,
      difficulty: difficulty ?? this.difficulty,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      authorName: authorName ?? this.authorName,
      authorImageUrl: authorImageUrl ?? this.authorImageUrl,
      authorLocation: authorLocation ?? this.authorLocation,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      servings: servings ?? this.servings,
    );
  }
}

/// Ingrédient d'une recette (nom, quantité, image optionnelle).
class Ingredient {
  const Ingredient({
    required this.name,
    required this.amount,
    this.imageUrl = 'assets/images/recipe_3.jpg',
  });

  final String name;
  final String amount;
  final String imageUrl;
}
