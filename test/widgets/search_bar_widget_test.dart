import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_hub/widgets/search_bar_widget.dart';

void main() {
  testWidgets('SearchBarWidget calls onChanged when typing', (tester) async {
    String? value;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchBarWidget(onChanged: (v) => value = v),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'salad');
    expect(value, 'salad');
    expect(find.text('Search recipe'), findsOneWidget);
  });

  testWidgets('SearchBarWidget shows filter button when provided', (
    tester,
  ) async {
    var filtered = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchBarWidget(onFilterTap: () => filtered = true),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.tune));
    expect(filtered, isTrue);
  });
}
