import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_hub/widgets/difficulty_badge.dart';

void main() {
  testWidgets('DifficultyBadge displays difficulty text', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: DifficultyBadge(difficulty: 'Easy')),
      ),
    );
    expect(find.text('Easy'), findsOneWidget);
  });
}
