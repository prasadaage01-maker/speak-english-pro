import 'package:flutter/material.dart';

import '../screens/auth/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/lessons/lesson_detail_screen.dart';
import '../screens/lessons/lessons_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/quiz/quiz_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/ai_chat/ai_chat_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const lessons = '/lessons';
  static const lessonDetail = '/lesson-detail';
  static const aiChat = '/ai-chat';
  static const quiz = '/quiz';
  static const profile = '/profile';
  static const settings = '/settings';

  static Map<String, WidgetBuilder> get routes => {
        login: (_) => const LoginScreen(),
        home: (_) => const HomeScreen(),
        lessons: (_) => const LessonsScreen(),
        aiChat: (_) => const AiChatScreen(),
        quiz: (_) => const QuizScreen(),
        profile: (_) => const ProfileScreen(),
        settings: (_) => const SettingsScreen(),
        lessonDetail: (_) => const LessonDetailScreen(),
      };
}
