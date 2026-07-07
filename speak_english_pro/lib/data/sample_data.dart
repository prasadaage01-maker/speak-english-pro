import '../models/lesson.dart';
import '../models/quiz_question.dart';

class SampleData {
  static const lessons = <Lesson>[
    Lesson(
      id: '1',
      titleEn: 'Alphabet',
      titleMr: 'अक्षरे',
      descriptionEn: 'Learn A to Z and basic pronunciation.',
      descriptionMr: 'A ते Z अक्षरे आणि उच्चार शिका.',
      points: ['A = Apple', 'B = Ball', 'C = Cat'],
    ),
    Lesson(
      id: '2',
      titleEn: 'Daily Vocabulary',
      titleMr: 'दैनंदिन शब्दसंग्रह',
      descriptionEn: 'Learn useful words for everyday use.',
      descriptionMr: 'दररोज वापरले जाणारे उपयुक्त शब्द शिका.',
      points: ['Morning', 'Water', 'Thank you'],
    ),
    Lesson(
      id: '3',
      titleEn: 'Simple Grammar',
      titleMr: 'सोपे व्याकरण',
      descriptionEn: 'Build sentences with I, You, He, She.',
      descriptionMr: 'I, You, He, She वापरून वाक्ये तयार करा.',
      points: ['I am ...', 'He is ...', 'They are ...'],
    ),
  ];

  static const quiz = <QuizQuestion>[
    QuizQuestion(
      questionEn: 'What is the English word for "पाणी"?',
      questionMr: '"पाणी" या शब्दाचा इंग्रजी शब्द कोणता?',
      options: ['Food', 'Water', 'Milk', 'Tea'],
      answerIndex: 1,
    ),
    QuizQuestion(
      questionEn: 'Choose the correct sentence.',
      questionMr: 'योग्य वाक्य निवडा.',
      options: ['I are student.', 'I is student.', 'I am a student.', 'I am student are.'],
      answerIndex: 2,
    ),
  ];
}
