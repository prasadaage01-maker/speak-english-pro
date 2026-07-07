import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_provider.dart';
import '../../providers/theme_provider.dart';
import '../../services/storage_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final langProvider = context.watch<AppLanguageProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            value: themeProvider.themeMode == ThemeMode.dark,
            title: const Text('Dark mode'),
            onChanged: (value) => themeProvider.toggleTheme(value),
          ),
          SwitchListTile(
            value: langProvider.locale.languageCode == 'mr',
            title: const Text('Marathi language'),
            onChanged: (value) => langProvider.setLanguage(value ? 'mr' : 'en'),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              title: const Text('Reset local progress'),
              subtitle: const Text('Clears lessons completed and streak'),
              onTap: () async {
                await StorageService.setLessonsCompleted(0);
                await StorageService.setStreakDays(0);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Local progress reset')),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
