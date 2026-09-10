import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_hub/l10n/app_localizations.dart';
import 'package:recipe_hub/utils/form_validators.dart';

void main() {
  final l10n = lookupAppLocalizations(const Locale('en'));

  group('FormValidators.requiredTitle', () {
    test('rejects empty and short titles', () {
      expect(FormValidators.requiredTitle(null, l10n), isNotNull);
      expect(FormValidators.requiredTitle('', l10n), isNotNull);
      expect(FormValidators.requiredTitle('ab', l10n), isNotNull);
    });

    test('accepts titles with at least 3 characters', () {
      expect(FormValidators.requiredTitle('Pie', l10n), isNull);
      expect(FormValidators.requiredTitle('  Pasta  ', l10n), isNull);
    });
  });

  group('FormValidators.requiredCategory', () {
    test('rejects null or empty', () {
      expect(FormValidators.requiredCategory(null, l10n), isNotNull);
      expect(FormValidators.requiredCategory('', l10n), isNotNull);
    });

    test('accepts a category', () {
      expect(FormValidators.requiredCategory('Italian', l10n), isNull);
    });
  });

  group('FormValidators.positiveDuration', () {
    test('rejects empty, non numeric and non positive', () {
      expect(FormValidators.positiveDuration(null, l10n), isNotNull);
      expect(FormValidators.positiveDuration('', l10n), isNotNull);
      expect(FormValidators.positiveDuration('abc', l10n), isNotNull);
      expect(FormValidators.positiveDuration('0', l10n), isNotNull);
      expect(FormValidators.positiveDuration('-5', l10n), isNotNull);
    });

    test('accepts positive integers', () {
      expect(FormValidators.positiveDuration('20', l10n), isNull);
    });
  });
}
