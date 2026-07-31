/// Validateurs réutilisables pour les formulaires (Add Recipe, Auth).
abstract final class FormValidators {
  /// Titre obligatoire, minimum 3 caractères.
  static String? requiredTitle(String? value) {
    if (value == null || value.trim().length < 3) {
      return 'Title must be at least 3 characters';
    }
    return null;
  }

  /// Catégorie obligatoire (dropdown).
  static String? requiredCategory(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Category is required';
    }
    return null;
  }

  /// Durée obligatoire, nombre entier positif (minutes).
  static String? positiveDuration(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Duration is required';
    }
    final n = int.tryParse(value.trim());
    if (n == null || n <= 0) {
      return 'Enter a positive number';
    }
    return null;
  }

  /// Email simple pour Sign In / Sign Up.
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Enter a valid email';
    }
    return null;
  }

  /// Mot de passe minimum 6 caractères.
  static String? password(String? value) {
    if (value == null || value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
