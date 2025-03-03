import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.title,
    this.subTitle,
    this.titleFontSize,
    this.subTitleFontSize,
  });

  final String image;
  final String title;
  final String? subTitle;
  final double? titleFontSize;
  final double? subTitleFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig.defaultSize! * 25,
          height: SizeConfig.defaultSize! * 24,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        const VerticalSpace(1),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: titleFontSize ??
                SizeConfig.defaultSize! * 3.5, 
            color: Colors.black87,
          ),
        ),
        const VerticalSpace(1),
        Text(
          subTitle!,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w300,
            fontSize: subTitleFontSize ?? SizeConfig.defaultSize! * 1.8,
            fontStyle: FontStyle.italic,
            color: const Color(0xFFABA0A0),
          ),
        )
      ],
    );
  }
}
