import 'package:egyptopia/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackgroundDecorations extends StatelessWidget {
  final bool isDark; // اختيار الوضع الداكن أو العادي (الافتراضي عادي)
  final Widget? child; 
    final VoidCallback? onTap;
    final bool showBackButton;
  const BackgroundDecorations({super.key, this.isDark = false, this.child, this.onTap, this.showBackButton = true,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDark
                  ? [const Color.fromARGB(255, 30, 26, 61),
                      const Color.fromARGB(255, 129, 143, 180),]
                  : [const Color.fromARGB(255, 67, 85, 133),
                      const Color.fromARGB(255, 223, 221, 227),],
            ),
          ),
        ),
         if (showBackButton)
        Align(
          alignment: const Alignment(-0.95, -0.95),
          child: IconButton(
                onPressed: onTap ?? () => GoRouter.of(context).pop(), 
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
        ),

        // left
        _decorImage(AssetsData.qMark, const Alignment(-0.9, -0.8)),
        _decorImage(AssetsData.puzzle, const Alignment(-2, -0.3), rotateAngle: 0.6),
        _decorImage(AssetsData.qMark, const Alignment(-0.8, 0.25), rotateAngle: -0.4),
        _decorImage(AssetsData.puzzle, const Alignment(-1.6, 0.9), rotateAngle: 0.6),

        // right
        _decorImage(AssetsData.puzzle, const Alignment(1.9, -0.9),rotateAngle: 2.7),
        _decorImage(AssetsData.qMark, const Alignment(1, -0.2), flipX: true,rotateAngle: -0.2),
        _decorImage(AssetsData.puzzle, const Alignment(2.2, 0.3),rotateAngle: 1.9),
        _decorImage(AssetsData.qMark, const Alignment(1.1, 0.9)),

        
        if (child != null) child!,
      ],
    );
  }

  Widget _decorImage(String imagePath, Alignment alignment,
      {double rotateAngle = 0, bool flipX = false}) {
    return Align(
      alignment: alignment,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..rotateZ(rotateAngle)
          ..scale(flipX ? -1.0 : 1.0, 1.0),
        child: Image.asset(
          imagePath,
          color: isDark ? Colors.grey[100] : Colors.black87, // تحديد اللون بناءً على الوضع
          colorBlendMode: BlendMode.srcIn, // مزج اللون مع الصورة
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
