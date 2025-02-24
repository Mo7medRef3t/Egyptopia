import 'package:egyptopia/core/constants.dart';
import 'package:egyptopia/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ReusableScreen extends StatelessWidget {
  final Widget child;
  final String? imageAsset;
  final List<Color>? backgroundColor;
  final List<double>? gradientStops;

  const ReusableScreen({
    super.key,
    required this.child,
    this.imageAsset = AssetsData.vectors,
    this.backgroundColor = konBordingColor,
    this.gradientStops,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: backgroundColor!,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: gradientStops ?? [0, 0.6],
          ),
        ),
        child: Stack(
          children: [
            if (imageAsset != null)
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Image.asset(imageAsset!),
              ),
            child,
          ],
        ),
      ),
    );
  }
}
