import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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

  Widget buildLevelButton(String level, Color color, Color textColor,
      String imagePath1, String imagePath2, String imagePath3) {
    bool isSelected = selectedLevel == level;

    return GestureDetector(
      onTap: () => selectLevel(level),
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                border: Border.all(
                    color: Colors.white,
                    width: 5), // Apply border only when selected
                borderRadius: BorderRadius.circular(12),
              )
            : null, // No border when not selected
        child: Container(
          width: SizeConfig.defaultSize! * 35,
          height: SizeConfig.defaultSize! * 12, // Reduced height
          padding: const EdgeInsets.only(left: 15), // Reduced padding
          decoration: BoxDecoration(
            color: color, // Always keep the original color
            borderRadius:
                BorderRadius.circular(5), // Slightly smaller border radius
          ),
          child: Stack(
            children: [
              // Text aligned to the left center
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  level,
                  style: GoogleFonts.imFellFrenchCanonSc(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: textColor, // Keep text color as defined
                  ),
                ),
              ),
              // First positioned image (Top Right)
              Positioned(
                top: -12,
                right: 5,
                child: Image.asset(
                  imagePath1,
                  width: 90,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              // Second positioned image (Bottom Left)
              Positioned(
                bottom: -7,
                left: -2,
                child: Image.asset(
                  imagePath2,
                  width: 90,
                  height: 55,
                  fit: BoxFit.contain,
                ),
              ),
              // Third positioned image (Bottom Right)
              Positioned(
                bottom: 5,
                right: 5,
                child: Image.asset(
                  imagePath3,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),

          // UI Elements
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VerticalSpace(1),
              // Title
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  'Choose Your\nLevel',
                  style: GoogleFonts.imFellFrenchCanonSc(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const VerticalSpace(2),

              // Level Buttons
              buildLevelButton(
                "Beginner",
                const Color.fromARGB(255, 159, 147, 211),
                Colors.black,
                'assets/images/firstright.png',
                'assets/images/firstleft.png',
                'assets/images/firstvec.png',
              ),
              const VerticalSpace(2),
              buildLevelButton(
                "Intermediate",
                const Color.fromARGB(255, 206, 174, 214),
                Colors.white,
                'assets/images/secondright.png',
                'assets/images/secondleft.png',
                'assets/images/secondvec.png',
              ),
              const VerticalSpace(2),
              buildLevelButton(
                "Advanced",
                const Color.fromARGB(255, 255, 212, 215),
                Colors.black,
                'assets/images/thirdright1.png',
                'assets/images/thirdleft1.png',
                'assets/images/thirdvec.png',
              ),

              const VerticalSpace(2),
              // Start Quiz Button
              ElevatedButton(
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
                    style: GoogleFonts.inter(
                      fontSize: 20, // Increased font size
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
