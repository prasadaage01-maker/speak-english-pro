import 'package:flutter/material.dart';

import '../services/storage_service.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = StorageService.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    StorageService.setDarkMode(isDark);
    notifyListeners();
  }
}
