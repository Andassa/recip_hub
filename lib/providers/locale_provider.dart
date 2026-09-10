import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider() {
    _loadLocale();
  }

  static const String _key = 'locale_code';

  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_key);
    if (code == 'fr') {
      _locale = const Locale('fr');
      notifyListeners();
    } else if (code == 'en') {
      _locale = const Locale('en');
      notifyListeners();
    }
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, locale.languageCode);
  }
}
