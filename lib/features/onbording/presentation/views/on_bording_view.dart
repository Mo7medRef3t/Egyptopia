import 'package:egyptopia/core/widgets/reusable_screen.dart';
import 'package:egyptopia/features/onbording/presentation/views/widgets/on_bording_body.dart';
import 'package:flutter/material.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReusableScreen(child: OnBordingBody());
  }
}
