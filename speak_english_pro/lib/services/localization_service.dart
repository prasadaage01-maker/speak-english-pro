class LocalizationService {
  static const Map<String, Map<String, String>> translations = {
    'en': {
      'appName': 'Speak English',
      'home': 'Home',
      'lessons': 'Lessons',
      'quiz': 'Quiz',
      'chat': 'AI Chat',
      'profile': 'Profile',
      'settings': 'Settings',
      'startLearning': 'Start Learning',
    },
    'mr': {
      'appName': 'स्पीक इंग्लिश',
      'home': 'मुख्यपृष्ठ',
      'lessons': 'धडे',
      'quiz': 'प्रश्नमंजुषा',
      'chat': 'AI चॅट',
      'profile': 'प्रोफाइल',
      'settings': 'सेटिंग्स',
      'startLearning': 'शिकणे सुरू करा',
    },
  };

  static String t(String key, String languageCode) {
    return translations[languageCode]?[key] ?? translations['en']?[key] ?? key;
  }
}
