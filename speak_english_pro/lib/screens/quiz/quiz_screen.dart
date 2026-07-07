import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/sample_data.dart';
import '../../providers/app_language_provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int score = 0;
  int? selected;

  void _next() {
    if (selected == SampleData.quiz[index].answerIndex) {
      score++;
    }
    if (index < SampleData.quiz.length - 1) {
      setState(() {
        index++;
        selected = null;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Quiz completed'),
          content: Text('Your score: $score / ${SampleData.quiz.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  index = 0;
                  score = 0;
                  selected = null;
                });
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<AppLanguageProvider>();
    final code = lang.locale.languageCode;
    final q = SampleData.quiz[index];
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Question ${index + 1}/${SampleData.quiz.length}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Text(code == 'mr' ? q.questionMr : q.questionEn, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            ...List.generate(q.options.length, (i) {
              final option = q.options[i];
              return Card(
                child: RadioListTile<int>(
                  value: i,
                  groupValue: selected,
                  title: Text(option),
                  onChanged: (v) => setState(() => selected = v),
                ),
              );
            }),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: selected == null ? null : _next,
                child: Text(index < SampleData.quiz.length - 1 ? 'Next' : 'Finish'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
