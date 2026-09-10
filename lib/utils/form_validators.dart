import '../l10n/app_localizations.dart';

abstract final class FormValidators {
  static String? requiredTitle(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().length < 3) {
      return l10n.titleMinLength;
    }
    return null;
  }

  static String? requiredCategory(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.categoryRequired;
    }
    return null;
  }

  static String? positiveDuration(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.durationRequired;
    }
    final n = int.tryParse(value.trim());
    if (n == null || n <= 0) {
      return l10n.enterPositiveNumber;
    }
    return null;
  }

  static String? email(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.emailIsRequired;
    }
    if (!value.contains('@')) {
      return l10n.enterValidEmail;
    }
    return null;
  }

  static String? password(String? value, AppLocalizations l10n) {
    if (value == null || value.length < 6) {
      return l10n.passwordMinLength;
    }
    return null;
  }
}
