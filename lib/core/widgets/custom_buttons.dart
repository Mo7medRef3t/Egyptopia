import 'package:egyptopia/core/constants.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton(
      {super.key, required this.text, required this.onTap});
  final String? text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.defaultSize! * 5.5,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: buttonColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ), borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text!,
            style:  GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.defaultSize! * 1.8,
            color:  Colors.white,
          ),
          ),
        ),
      ),
    );
  }
}

class BackGeneralButton extends StatelessWidget {
  const BackGeneralButton(
      {super.key, required this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.defaultSize! * 5.5,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
           borderRadius: BorderRadius.circular(10),
            border: Border.all( 
      color: const Color(0xFF363062), 
    ),
           ),
           
        child: Center(
          child: Text(
            "Back",
            style:  GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.defaultSize! * 1.8,
            color:  const Color(0xFF363062),
          ),
          ),
        ),
      ),
    );
  }
}

