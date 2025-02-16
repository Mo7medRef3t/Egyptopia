import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.dotIndex});
  final double? dotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: const Color(0xFFD9D9D9),
          activeColor: const Color(0xFF435585),
          size: const Size(14.0, 14.0),
          activeSize: const Size(14.0, 14.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      dotsCount: 3,
      position: dotIndex!.toInt(),
    );
  }
}
