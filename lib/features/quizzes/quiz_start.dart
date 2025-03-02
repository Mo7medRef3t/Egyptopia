import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'background_decorations.dart';

class QuizStart extends StatelessWidget {
  const QuizStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecorations(
        onTap: () {
          context.push(AppRouter.kHomePage);
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/largequiz.png',
                width: SizeConfig.defaultSize! * 37,
                height: SizeConfig.defaultSize! * 30,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize! * 3.3,
                    vertical: SizeConfig.defaultSize! * 2),
                child: Text(
                  'Play to Gain Your\nKnowledge',
                  style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2.4,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 31, 37, 68),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize! * 3),
                child: CustomGeneralButton(
                  text: 'Get Started',
                  onTap: () {
                    GoRouter.of(context).pushReplacement(AppRouter.kQuizLevels);
                  },
                ),
              )
            ]),
      ),
    );
  }
}
