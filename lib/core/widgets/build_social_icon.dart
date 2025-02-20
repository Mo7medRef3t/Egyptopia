import 'package:flutter/material.dart';

class BuildSocialIcon extends StatelessWidget {
  const BuildSocialIcon(
      {super.key, required this.assetPath, required this.size});
  final String assetPath;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: size / 2, // Adjusted radius
        backgroundColor: Colors.white,
        child:
            Image.asset(assetPath, height: size, width: size), // Set icon size
      ),
    );
  }
}
