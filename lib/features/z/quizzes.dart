import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/widgets/custom_buttons.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Quizzes extends StatelessWidget {
  const Quizzes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 67, 85, 133), // Dark shade
                  Color.fromARGB(255, 223, 221, 227), // Light shade
                ],
              ),
            ),
          ),
          // Positioned Shapes
          Positioned(
            top: 15,
            right: -73,
            child: Image.asset(
              'assets/images/right1.png', // Ensure you add this to assets
              width: 300,
              height: 300,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Positioned(
            top: 150,
            left: -85,
            child: Image.asset(
              'assets/images/left2.png', // Ensure you add this to assets
              width: 300,
              height: 300,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Positioned(
            top: 250,
            right: -30,
            child: Image.asset(
              'assets/images/right2.png', // Ensure you add this to assets
              width: 150,
              height: 150,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Positioned(
            bottom: 120,
            right: -90,
            child: Image.asset(
              'assets/images/right3.png', // Ensure you add this to assets
              width: 300,
              height: 300,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Positioned(
            bottom: 250,
            left: 0,
            child: Image.asset(
              'assets/images/left3.png', // Ensure you add this to assets
              width: 150,
              height: 150,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Positioned(
            bottom: 5,
            left: -60,
            child: Image.asset(
              'assets/images/left4.png', // Ensure you add this to assets
              width: 300,
              height: 300,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Positioned(
            bottom: 15,
            right: -15,
            child: Image.asset(
              'assets/images/right4.png',
              width: 150,
              height: 150,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Positioned(
            top: 60,
            left: -20,
            child: Image.asset(
              'assets/images/left1.png',
              width: 150,
              height: 150,
              opacity: const AlwaysStoppedAnimation(1),
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
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/largequiz.png', // Ensure you add this to assets
                  width: 400,
                  height: 400,
                ),
                const VerticalSpace(1),
                Container(
                  width: double.infinity, // Ensure full width
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35), // Adjust padding as needed
                  child: Text(
                    'Play to Gain Your\nKnowledge',
                    style: GoogleFonts.imFellFrenchCanonSc(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 31, 37, 68),
                    ),
                    textAlign: TextAlign.left, // Align text to the left
                  ),
                ),
                const VerticalSpace(2),
                SizedBox(
                  width: SizeConfig.defaultSize! * 36, // Adjust width
                  height: SizeConfig.defaultSize! * 5, // Adjust height
                  child: CustomGeneralButton(
                    text: 'Get Started',
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kQuizLevels);
                    },
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
