import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/app_language_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/theme_provider.dart';
import 'routes/app_routes.dart';
import 'screens/splash/splash_screen.dart';
import 'theme/app_theme.dart';

class SpeakEnglishApp extends StatelessWidget {
  const SpeakEnglishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer2<ThemeProvider, AppLanguageProvider>(
        builder: (context, themeProvider, languageProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Speak English',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            locale: languageProvider.locale,
            routes: AppRoutes.routes,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
