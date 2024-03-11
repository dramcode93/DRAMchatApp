import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale? _currentLocale; // Use an underscore for private member

  Locale? get currentLocale => _currentLocale;

  Future<void> switchLanguage(String? languageCode) async {
    switch (languageCode) {
      case 'arabic':
        _currentLocale = const Locale('ar', 'AR');
        break;
      case 'english':
        _currentLocale = const Locale('en', 'US');
        break;
      default:
        _currentLocale = const Locale('en', 'US');
    }
    await saveLang(languageCode);
    print(_currentLocale);
    notifyListeners();
  }

  Future<void> saveLang(String? languageCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('language', languageCode ?? 'en');
    // await sharedPreferences.setBool('LanguageSelected', true);
  }

  Future<void> loadSavedLang() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? savedLang = sharedPreferences.getString('language');
    await switchLanguage(savedLang);
    notifyListeners();
  }
}
