import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late bool isDark = false;

  Future<void> toggleDarkMode() async {
    isDark = !isDark;
    _saveDarkMode(isDark);
    notifyListeners();
  }

  Future<void> loadSavedDarkMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? savedDarkMode = sharedPreferences.getBool('dark');
    if (savedDarkMode != null) {
      isDark = savedDarkMode;
      notifyListeners();
    }
  }

  Future<void> _saveDarkMode(bool isDark) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('dark', isDark);
    notifyListeners();
  }
}
