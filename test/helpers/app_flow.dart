import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_hub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void silenceGoogleFontLoadErrors() {
  final previous = FlutterError.onError;
  FlutterError.onError = (details) {
    final message = details.exceptionAsString();
    if (message.contains('google_fonts') || message.contains('Poppins-')) {
      return;
    }
    previous?.call(details);
  };
}

Future<void> launchAppAtHome(
  WidgetTester tester, {
  bool allowFontFetch = false,
}) async {
  GoogleFonts.config.allowRuntimeFetching = allowFontFetch;
  SharedPreferences.setMockInitialValues({});
  final view = tester.view;
  view.physicalSize = const Size(1080, 2340);
  view.devicePixelRatio = 3;
  addTearDown(view.resetPhysicalSize);
  addTearDown(view.resetDevicePixelRatio);

  await tester.pumpWidget(const RecipeHubApp());
  await tester.pump();

  await tester.tap(find.text('Start Cooking'));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 300));

  await tester.enterText(find.byType(TextFormField).at(0), 'user@test.com');
  await tester.enterText(find.byType(TextFormField).at(1), 'secret1');
  await tester.tap(find.text('Sign In'));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 600));
  await tester.pump();
}
