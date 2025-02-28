import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:egyptopia/features/z/quiz_results.dart';
import 'package:flutter/material.dart';
import 'package:egyptopia/features/z/question_model.dart';
import 'package:egyptopia/features/z/quiz_data.dart';

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

  @override
  void initState() {
    super.initState();
    questions = QuizData.questionsByLevel[widget.level] ?? [];
  }

  void checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex].correctIndex) {
      score++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        quizCompleted = true; // Quiz is finished
      });
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
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 30, 26, 61),
                  Color.fromARGB(255, 129, 143, 180),
                ],
              ),
            ),
          ),

          // Restore all missing Positioned image assets
          Positioned(
            top: 15,
            right: -73,
            child: Image.asset(
              'assets/images/right12.png',
              width: 300,
              height: 300,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Positioned(
            top: 150,
            left: -85,
            child: Image.asset(
              'assets/images/left22.png',
              width: 300,
              height: 300,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Positioned(
            top: 250,
            right: -30,
            child: Image.asset(
              'assets/images/right22.png',
              width: 150,
              height: 150,
              opacity: const AlwaysStoppedAnimation(0.6),
            ),
          ),
          Positioned(
            bottom: 120,
            right: -90,
            child: Image.asset(
              'assets/images/right32.png',
              width: 300,
              height: 300,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Positioned(
            bottom: 250,
            left: 0,
            child: Image.asset(
              'assets/images/left32.png',
              width: 150,
              height: 150,
              opacity: const AlwaysStoppedAnimation(0.6),
            ),
          ),
          Positioned(
            bottom: 5,
            left: -60,
            child: Image.asset(
              'assets/images/left42.png',
              width: 300,
              height: 300,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Positioned(
            bottom: 15,
            right: -15,
            child: Image.asset(
              'assets/images/right42.png',
              width: 150,
              height: 150,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Positioned(
            top: 60,
            left: -20,
            child: Image.asset(
              'assets/images/left12.png',
              width: 150,
              height: 150,
              opacity: const AlwaysStoppedAnimation(0.6),
            ),
          ),
          Positioned(
            left: SizeConfig.defaultSize!,
            top: SizeConfig.defaultSize! * 2,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          // Quiz Content
          Padding(
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
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // Display Image (if available)
                const VerticalSpace(2),

                if (questions[currentQuestionIndex].imagePath.isNotEmpty)
                  Center(
                    child: Image.asset(
                      questions[currentQuestionIndex].imagePath,
                      width: 300, // Adjust as needed
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                const VerticalSpace(2.5),
                Text(
                  questions[currentQuestionIndex].question,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two items per row
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3.5, // Adjust button height
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
                          style: const TextStyle(fontSize: 16)),
                    );
                  },
                ),

                const SizedBox(height: 30),

                // "Go to Results" Button
                if (quizCompleted)
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizResultsScreen(
                              score: score,
                              totalQuestions: questions.length,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Go to Results"),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
