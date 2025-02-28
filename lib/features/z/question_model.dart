class Question {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String imagePath;

  Question({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.imagePath,
  });
}
