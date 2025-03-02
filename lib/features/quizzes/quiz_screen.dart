import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:egyptopia/features/quizzes/quiz_data.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'background_decorations.dart';

class QuizScreen extends StatefulWidget {
  final String level;
  const QuizScreen({super.key, required this.level});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> questions;
  int currentQuestionIndex = 0;
  int score = 0;
  bool quizCompleted = false;
  List<Map<String, dynamic>> wrongAnswers = [];

  @override
  void initState() {
    super.initState();
    questions = QuizData.questionsByLevel[widget.level] ?? [];
  }

  void checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex].correctIndex) {
      score++;
    } else {
      // تخزين السؤال والإجابة الخاطئة
      wrongAnswers.add({
        'question': questions[currentQuestionIndex].question,
        'wrongAnswer': questions[currentQuestionIndex].options[selectedIndex],
        'correctAnswer': questions[currentQuestionIndex]
            .options[questions[currentQuestionIndex].correctIndex],
      });
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() => currentQuestionIndex++);
    } else {
      setState(() => quizCompleted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text("No questions available for ${widget.level} level."),
        ),
      );
    }
    return Scaffold(
      body: BackgroundDecorations(
        isDark: true,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(7.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.level} Quiz",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Question ${currentQuestionIndex + 1}/${questions.length}",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(2),
              if (questions[currentQuestionIndex].imagePath.isNotEmpty)
                Center(
                  child: Image.asset(
                    questions[currentQuestionIndex].imagePath,
                    width: SizeConfig.defaultSize! * 28,
                    height: SizeConfig.defaultSize! * 26,
                    fit: BoxFit.cover,
                  ),
                ),
              const VerticalSpace(2.5),
              Text(
                questions[currentQuestionIndex].question,
                style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const VerticalSpace(1),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3.5,
                ),
                itemCount: questions[currentQuestionIndex].options.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () => checkAnswer(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      questions[currentQuestionIndex].options[index],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
              const VerticalSpace(2),
              if (quizCompleted)
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushReplacement(
                        AppRouter.kQuizResults,
                        extra: {
                          'score': score,
                          'totalQuestions': questions.length,
                          'wrongAnswers': wrongAnswers,
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Go to Results",
                      style: GoogleFonts.lato(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
