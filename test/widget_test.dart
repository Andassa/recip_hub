import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_hub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Recipe Hub shows splash screen', (tester) async {
    await tester.pumpWidget(const RecipeHubApp());
    await tester.pump();
    expect(find.text('Get\nCooking'), findsOneWidget);
    expect(find.text('Start Cooking'), findsOneWidget);
    expect(find.text('100K+ Premium Recipe'), findsOneWidget);
  });
}
