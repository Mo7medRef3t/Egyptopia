import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/size_config.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SizedBox(
            height: SizeConfig.defaultSize! * 5,
            width: SizeConfig.screenWidth,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search Places, Activities...",
                hintStyle: GoogleFonts.inter(color: const Color(0xFF7D848D)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2)),
                prefixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search)),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.microphone,
                      size: 20,
                    )),
              ),
            )));
  }
}
