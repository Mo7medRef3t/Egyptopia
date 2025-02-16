import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/utils/assets.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> fadeAnimation;

  late final Animation<double> rotateAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    goNextPage();
  }

  void _initAnimations() {
    _animationController = AnimationController(
      vsync: this,duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);
  
    fadeAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(_animationController);

    rotateAnimation = Tween<double>(begin: -0.1, end: 0.1).animate(

      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: rotateAnimation,
              child: Image.asset(
                AssetsData.logo,
                height: SizeConfig.defaultSize! * 13,
              ),
            ),
            Center(
              child: FadeTransition(
                opacity: fadeAnimation,
                child: Text(
                  "Egyptopia",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.defaultSize! * 4.8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(AssetsData.vectors),
        ),
      ],
    );
  }

  void goNextPage() {
    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).pushReplacement(AppRouter.kOnBordingView);
    });
  }
}
