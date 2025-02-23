import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:egyptopia/core/utils/assets.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/constants.dart';
import 'package:egyptopia/core/widgets/custom_buttons.dart';
import 'package:go_router/go_router.dart';

class RegistrationBody extends StatelessWidget {
  const RegistrationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight! * 0.73,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(SizeConfig.defaultSize! * 14),
            ),
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
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.defaultSize! * 2,
            horizontal: SizeConfig.defaultSize! * 3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Start Discovering Egypt Like Never Before",
                textAlign: TextAlign.center,
                style: GoogleFonts.imFellFrenchCanon(
                  fontSize: SizeConfig.defaultSize! * 1.8,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1F2544),
                ),
              ),
              const VerticalSpace(2),
              Row(
                children: [
                  Expanded(
                    child: CustomGeneralButton(
                      text: "Sign up",
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kSignUp);
                      },
                    ),
                  ),
                  const HorizantalSpace(1),
                  Expanded(
                    child: CustomGeneralButton(
                      text: "Sign in",
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kSignIn);
                      },
                    ),
                  ),
                ],
              ),
              const VerticalSpace(1),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go(AppRouter.kHomePage);
                },
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
              const VerticalSpace(1),
              Text(
                "Egyptopia",
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize! * 4.8,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const VerticalSpace(7),
              Image.asset(AssetsData.vectors),
            ],
          ),
        ),
      ],
    );
  }
}
