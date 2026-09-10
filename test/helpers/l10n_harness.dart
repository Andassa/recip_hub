import 'package:flutter/material.dart';
import 'package:recipe_hub/l10n/app_localizations.dart';

Widget wrapWithL10n(Widget child, {Locale locale = const Locale('en')}) {
  return MaterialApp(
    locale: locale,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: child,
  );
}
