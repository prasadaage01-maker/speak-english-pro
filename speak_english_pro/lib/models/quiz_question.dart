class QuizQuestion {
  final String questionEn;
  final String questionMr;
  final List<String> options;
  final int answerIndex;

  const QuizQuestion({
    required this.questionEn,
    required this.questionMr,
    required this.options,
    required this.answerIndex,
  });
}
