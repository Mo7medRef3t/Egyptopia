import 'package:egyptopia/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  final String level;
  final Color backgroundColor;
  final Color textColor;
  final Color iconsColor;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const LevelButton({
    super.key,
    required this.level,
    required this.backgroundColor,
    required this.textColor,
    required this.iconsColor,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Container(
          height: SizeConfig.defaultSize! * 12,
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  level,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                ),
              ),
              Positioned(
                top: -12,
                right: 5,
                child: Image.asset(
                  'assets/images/firstright.png',
                  color: iconsColor,
                  width: 90,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: -7,
                left: -2,
                child: Image.asset(
                  'assets/images/firstleft.png',
                  color: iconsColor,
                  width: 90,
                  height: 55,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Image.asset(
                  imagePath,
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
}
