import 'package:flutter/material.dart';

import '../services/storage_service.dart';

class AppLanguageProvider extends ChangeNotifier {
  Locale _locale = Locale(StorageService.languageCode);

  Locale get locale => _locale;

  void setLanguage(String languageCode) {
    _locale = Locale(languageCode);
    StorageService.setLanguageCode(languageCode);
    notifyListeners();
  }

  bool get isMarathi => _locale.languageCode == 'mr';
}
