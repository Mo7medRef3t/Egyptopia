import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildCategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  const BuildCategoryIcon(
      {super.key,
      required this.icon,
      required this.label,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(route),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFF1F2544),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(label,
              style: GoogleFonts.inter(
                  fontSize: 12, color: const Color(0xFF1F2544))),
        ],
      ),
    );
  }
}
