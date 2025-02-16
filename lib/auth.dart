import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:egyptopia/core/utils/assets.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/constants.dart';
import 'package:egyptopia/core/widgets/custom_buttons.dart';
import 'package:go_router/go_router.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          // Background with smooth bottom-left curve
          SizedBox(
            height: SizeConfig.screenHeight! * 0.73, // Adjust height as needed
            width: double.infinity,
            child: ClipPath(
              clipper: BottomLeftCurveClipper(),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: kMainColor,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),

          // White Container at the Bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.defaultSize! * 2,
                horizontal: SizeConfig.defaultSize! * 3,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Start Discovering Egypt Like Never Before",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.imFellFrenchCanon(
                      fontSize: SizeConfig.defaultSize! * 1.8,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize! * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomGeneralButton(
                          text: "Sign up",
                          onTap: () {
                            context.push('/signup');
                          },
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize!),
                      Expanded(
                        child: CustomGeneralButton(
                          text: "Sign in",
                          onTap: () {
                            context.push('/signin');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.defaultSize!),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Skip for now",
                      style: GoogleFonts.inter(
                        decoration: TextDecoration.underline,
                        fontSize: SizeConfig.defaultSize! * 1.6,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Logo & Title
          Positioned(
            top: SizeConfig.defaultSize! * 15,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  AssetsData.logo,
                  height: SizeConfig.defaultSize! * 13,
                ),
                SizedBox(height: SizeConfig.defaultSize!),
                Text(
                  "Egyptopia",
                  style: GoogleFonts.imFellFrenchCanonSc(
                    fontSize: SizeConfig.defaultSize! * 4.8,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize! * 7.5),
                Image.asset(AssetsData.vectors),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for Only Bottom-Left Smooth Curve
class BottomLeftCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from top-left
    path.lineTo(0, size.height - 120); // Move higher for a rounded transition

    // Perfectly rounded bottom-left curve using cubic Bézier
    path.cubicTo(
      0, size.height, // First control point (keeps it close to the left)
      120, size.height, // Second control point (brings it outward)
      180, size.height, // End point (smooth arc)
    );

    // Continue straight across the bottom-right
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
