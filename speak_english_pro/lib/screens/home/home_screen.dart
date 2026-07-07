import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_provider.dart';
import '../../routes/app_routes.dart';
import '../../services/localization_service.dart';
import '../../services/storage_service.dart';
import '../../widgets/section_header.dart';
import '../../data/sample_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<AppLanguageProvider>();
    final code = lang.locale.languageCode;

    final lessonsCompleted = StorageService.lessonsCompleted;
    final streak = StorageService.streakDays;

    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationService.t('appName', code)),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.primaryContainer],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                const Icon(Icons.school_rounded, size: 48, color: Colors.white),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocalizationService.t('startLearning', code),
                        style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Marathi + English learning with AI support',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(child: _StatCard(title: 'Lessons', value: '$lessonsCompleted')),
              const SizedBox(width: 12),
              Expanded(child: _StatCard(title: 'Streak', value: '$streak days')),
            ],
          ),
          const SizedBox(height: 24),
          SectionHeader(
            title: LocalizationService.t('lessons', code),
            subtitle: 'Learn step by step',
            onTap: () => Navigator.pushNamed(context, AppRoutes.lessons),
          ),
          const SizedBox(height: 12),
          ...SampleData.lessons.map(
            (lesson) => Card(
              child: ListTile(
                leading: CircleAvatar(child: Text(lesson.id)),
                title: Text(code == 'mr' ? lesson.titleMr : lesson.titleEn),
                subtitle: Text(code == 'mr' ? lesson.descriptionMr : lesson.descriptionEn),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                onTap: () => Navigator.pushNamed(context, AppRoutes.lessonDetail, arguments: lesson),
              ),
            ),
          ),
          const SizedBox(height: 24),
          SectionHeader(
            title: 'Quick Actions',
            subtitle: 'Practice from anywhere',
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _ActionChip(icon: Icons.chat_bubble_rounded, label: LocalizationService.t('chat', code), onTap: () => Navigator.pushNamed(context, AppRoutes.aiChat)),
              _ActionChip(icon: Icons.quiz_rounded, label: LocalizationService.t('quiz', code), onTap: () => Navigator.pushNamed(context, AppRoutes.quiz)),
              _ActionChip(icon: Icons.person_rounded, label: LocalizationService.t('profile', code), onTap: () => Navigator.pushNamed(context, AppRoutes.profile)),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionChip({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      onPressed: onTap,
    );
  }
}
