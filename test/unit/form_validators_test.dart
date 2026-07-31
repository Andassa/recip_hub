import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_hub/utils/form_validators.dart';

void main() {
  group('FormValidators.requiredTitle', () {
    test('rejects empty and short titles', () {
      expect(FormValidators.requiredTitle(null), isNotNull);
      expect(FormValidators.requiredTitle(''), isNotNull);
      expect(FormValidators.requiredTitle('ab'), isNotNull);
    });

    test('accepts titles with at least 3 characters', () {
      expect(FormValidators.requiredTitle('Pie'), isNull);
      expect(FormValidators.requiredTitle('  Pasta  '), isNull);
    });
  });

  group('FormValidators.requiredCategory', () {
    test('rejects null or empty', () {
      expect(FormValidators.requiredCategory(null), isNotNull);
      expect(FormValidators.requiredCategory(''), isNotNull);
    });

    test('accepts a category', () {
      expect(FormValidators.requiredCategory('Italian'), isNull);
    });
  });

  group('FormValidators.positiveDuration', () {
    test('rejects empty, non numeric and non positive', () {
      expect(FormValidators.positiveDuration(null), isNotNull);
      expect(FormValidators.positiveDuration(''), isNotNull);
      expect(FormValidators.positiveDuration('abc'), isNotNull);
      expect(FormValidators.positiveDuration('0'), isNotNull);
      expect(FormValidators.positiveDuration('-5'), isNotNull);
    });

    test('accepts positive integers', () {
      expect(FormValidators.positiveDuration('20'), isNull);
    });
  });
}
