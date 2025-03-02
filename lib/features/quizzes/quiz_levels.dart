import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'background_decorations.dart';
import 'level_button.dart';

class QuizLevels extends StatefulWidget {
  const QuizLevels({super.key});

  @override
  State<QuizLevels> createState() => _QuizLevelsState();
}

class _QuizLevelsState extends State<QuizLevels> {
  String selectedLevel = ""; // Stores selected level

  void selectLevel(String level) {
    setState(() {
      selectedLevel = level;
    });
  }

  void startQuiz() {
    if (selectedLevel.isNotEmpty) {
      GoRouter.of(context).push('/quiz/${selectedLevel.toLowerCase()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecorations(
        onTap: () {
          context.pushReplacement(AppRouter.kQuizStart);
        },
        isDark: true,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 3.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(1),
              const Text(
                'Choose Your\nLevel',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const VerticalSpace(2),
              LevelButton(
                level: "Beginner",
                backgroundColor: const Color.fromARGB(255, 159, 147, 211),
                textColor: Colors.black,
                iconsColor: const Color(0xFF8074B4),
                imagePath: 'assets/images/firstvec.png',
                isSelected: selectedLevel == "Beginner",
                onTap: () => selectLevel("Beginner"),
              ),
              const VerticalSpace(2),
              LevelButton(
                level: "Intermediate",
                backgroundColor: const Color.fromARGB(255, 206, 174, 214),
                textColor: Colors.white,
                iconsColor: const Color(0xFFB490BD),
                imagePath: 'assets/images/secondvec.png',
                isSelected: selectedLevel == "Intermediate",
                onTap: () => selectLevel("Intermediate"),
              ),
              const VerticalSpace(2),
              LevelButton(
                level: "Advanced",
                backgroundColor: const Color.fromARGB(255, 255, 212, 215),
                textColor: Colors.black,
                iconsColor: const Color(0xFFDAAEAC),
                imagePath: 'assets/images/thirdvec.png',
                isSelected: selectedLevel == "Advanced",
                onTap: () => selectLevel("Advanced"),
              ),
              const VerticalSpace(2),
              Center(
                child: ElevatedButton(
                  onPressed: startQuiz,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                  ),
                  child: Text(
                    "Start Quiz",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
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
