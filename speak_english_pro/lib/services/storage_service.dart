import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isDarkMode => _prefs.getBool('isDarkMode') ?? false;
  static Future<void> setDarkMode(bool value) => _prefs.setBool('isDarkMode', value);

  static String get languageCode => _prefs.getString('languageCode') ?? 'en';
  static Future<void> setLanguageCode(String code) => _prefs.setString('languageCode', code);

  static bool get onboardingSeen => _prefs.getBool('onboardingSeen') ?? false;
  static Future<void> setOnboardingSeen(bool value) => _prefs.setBool('onboardingSeen', value);

  static int get lessonsCompleted => _prefs.getInt('lessonsCompleted') ?? 0;
  static Future<void> setLessonsCompleted(int value) => _prefs.setInt('lessonsCompleted', value);

  static int get streakDays => _prefs.getInt('streakDays') ?? 0;
  static Future<void> setStreakDays(int value) => _prefs.setInt('streakDays', value);
}
