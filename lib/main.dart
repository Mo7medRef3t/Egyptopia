import 'package:egyptopia/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return  MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(
        textTheme: GoogleFonts.imFellFrenchCanonScTextTheme()
      ),
    );
  }
}
