import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'background_decorations.dart';

class QuizResults extends StatefulWidget {
  final int score;
  final int totalQuestions;
  final List<Map<String, dynamic>> wrongAnswers;

  const QuizResults({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.wrongAnswers,
  });

  @override
  State<QuizResults> createState() => _QuizResultsState();
}

class _QuizResultsState extends State<QuizResults> {
  bool showWrongAnswers = false; // ✅ تعريف المتغير

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecorations(
        showBackButton: false,
        isDark: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Quiz Completed!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const VerticalSpace(2),
              Text(
                "Your Score: ${widget.score}/${widget.totalQuestions}",
                style: GoogleFonts.ebGaramond(fontSize: 26, color: Colors.white),
              ),
              const VerticalSpace(3),

              ElevatedButton(
                onPressed: () {
                  context.pushReplacement(AppRouter.kQuizLevels);
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
                  "Back to Quizzes",
                  style: GoogleFonts.lato(fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 10),

              // ✅ زر إظهار / إخفاء الأخطاء
              if (widget.wrongAnswers.isNotEmpty)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showWrongAnswers = !showWrongAnswers;
                    });
                  },
                  child: Text(
                    showWrongAnswers ? "Hide Review" : "Review Wrong Answers",
                    style: GoogleFonts.lato(fontWeight: FontWeight.w600),
                  ),
                ),

              const SizedBox(height: 10),

              // ✅ عرض الأخطاء عند الضغط على زر المراجعة
              if (showWrongAnswers && widget.wrongAnswers.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.wrongAnswers.length,
                    itemBuilder: (context, index) {
                      final wrongAnswer = widget.wrongAnswers[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            "Q: ${wrongAnswer['question']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "❌ Your Answer: ${wrongAnswer['wrongAnswer']}",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                  "✅ Correct Answer: ${wrongAnswer['correctAnswer']}",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
