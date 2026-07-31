import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_hub/widgets/category_chip.dart';

void main() {
  testWidgets('CategoryChip shows label and reacts to tap', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CategoryChip(
            label: 'Italian',
            isSelected: true,
            onTap: () => tapped = true,
          ),
        ),
      ),
    );

    expect(find.text('Italian'), findsOneWidget);
    await tester.tap(find.text('Italian'));
    expect(tapped, isTrue);
  });
}
