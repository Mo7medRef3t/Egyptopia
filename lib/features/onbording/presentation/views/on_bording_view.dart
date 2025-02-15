import 'package:egyptopia/core/constants.dart';
import 'package:egyptopia/features/onbording/presentation/views/widgets/on_bording_body.dart';
import 'package:flutter/material.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: secondaryColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.45],
          ),
        ),
        child: const OnBordingBody(),
    )
    );
  }
}