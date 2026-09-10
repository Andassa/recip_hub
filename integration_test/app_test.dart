import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';

import '../test/helpers/app_flow.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = true;
  silenceGoogleFontLoadErrors();

  testWidgets('sign in, open recipe, save favorite, see it in saved', (
    tester,
  ) async {
    await launchAppAtHome(tester, allowFontFetch: true);

    expect(find.text('Hello Jega'), findsOneWidget);

    await tester.tap(find.text('Crunchy Nut Coleslaw').first);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('Crunchy Nut Coleslaw'), findsWidgets);

    await tester.tap(find.byTooltip('Add to favorites').last);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    await tester.tap(find.byTooltip('Back'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tap(find.byTooltip('Saved recipes'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Crunchy Nut Coleslaw'), findsWidgets);
  });
}
