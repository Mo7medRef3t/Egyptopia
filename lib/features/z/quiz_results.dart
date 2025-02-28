import 'package:flutter/material.dart';
import 'package:egyptopia/features/z/quiz_level.dart';

class QuizResultsScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const QuizResultsScreen(
      {super.key, required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
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
          // Results Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Quiz Completed!",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Your Score: $score / $totalQuestions",
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuizLevels()),
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
                  child: const Text("Back to Quizzes"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
