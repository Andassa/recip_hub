import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/app_flow.dart';

void main() {
  testWidgets('add recipe from home fab and see it on home', (tester) async {
    await launchAppAtHome(tester);

    await tester.tap(find.byTooltip('Add recipe'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Add Recipe'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'Paprika Pasta');

    await tester.tap(find.byType(DropdownButtonFormField<String>).first);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Italian').last);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    await tester.enterText(find.byType(TextFormField).at(1), '25');

    final saveFinder = find.text('Save Recipe');
    await tester.ensureVisible(saveFinder);
    await tester.tap(saveFinder);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pump();

    expect(find.text('Paprika Pasta'), findsWidgets);
  });
}
