import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/sample_data.dart';
import '../../providers/app_language_provider.dart';
import '../../routes/app_routes.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<AppLanguageProvider>();
    final code = lang.locale.languageCode;

    return Scaffold(
      appBar: AppBar(title: const Text('Lessons')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: SampleData.lessons.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, index) {
          final lesson = SampleData.lessons[index];
          return Card(
            child: ListTile(
              title: Text(code == 'mr' ? lesson.titleMr : lesson.titleEn),
              subtitle: Text(code == 'mr' ? lesson.descriptionMr : lesson.descriptionEn),
              onTap: () => Navigator.pushNamed(context, AppRoutes.lessonDetail, arguments: lesson),
            ),
          );
        },
      ),
    );
  }
}
