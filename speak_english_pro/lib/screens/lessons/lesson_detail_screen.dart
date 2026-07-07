import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/lesson.dart';
import '../../providers/app_language_provider.dart';

class LessonDetailScreen extends StatelessWidget {
  const LessonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lesson = ModalRoute.of(context)?.settings.arguments as Lesson?;
    final lang = context.watch<AppLanguageProvider>();
    final code = lang.locale.languageCode;

    final selected = lesson ?? const Lesson(
      id: '0',
      titleEn: 'Lesson',
      titleMr: 'धडा',
      descriptionEn: 'No lesson selected.',
      descriptionMr: 'कोणताही धडा निवडलेला नाही.',
      points: [],
    );

    return Scaffold(
      appBar: AppBar(title: Text(code == 'mr' ? selected.titleMr : selected.titleEn)),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              code == 'mr' ? selected.descriptionMr : selected.descriptionEn,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            ...selected.points.map(
              (p) => Card(
                child: ListTile(
                  leading: const Icon(Icons.check_circle_rounded),
                  title: Text(p),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
