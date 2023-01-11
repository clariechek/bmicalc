import 'package:flutter/material.dart';

class ThemeStateNotifier with ChangeNotifier {
  static bool _isDark = true;

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  bool switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
    return _isDark;
  }
}
