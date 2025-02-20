import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/utils/assets.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/build_social_icon.dart';
import 'package:egyptopia/core/widgets/custom_buttons.dart';
import 'package:egyptopia/core/widgets/custom_fields.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          Image.asset(
            AssetsData.logo,
            height: SizeConfig.defaultSize! * 10,
          ),
          Text(
            "Egyptopia",
            style: TextStyle(
              fontSize: SizeConfig.defaultSize! * 3,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalSpace(1),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize!,
                  vertical: SizeConfig.defaultSize! * 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(SizeConfig.defaultSize! * 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" Sign in",
                        style: GoogleFonts.imFellFrenchCanon(
                            fontSize: 30, fontWeight: FontWeight.w500)),
                    const VerticalSpace(2),
                    const CustomInputField(
                        label: "Email",
                        hint: "Enter Your Email",
                        inputType: TextInputType.emailAddress),
                    const VerticalSpace(1.5),
                    const CustomInputField(
                      label: "Password",
                      hint: "Enter Your Password",
                      isPassword: true,
                    ),
                    const VerticalSpace(2),
                    CustomGeneralButton(
                      text: "Sign in",
                      onTap: () {},
                    ),
                    SizedBox(height: SizeConfig.defaultSize!),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: GoogleFonts.inter(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                            fontSize: SizeConfig.defaultSize! * 1.6,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpace(1),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "OR",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpace(1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildSocialIcon(
                            assetPath: AssetsData.fblogo,
                            size: SizeConfig.defaultSize! * 3),
                        const HorizantalSpace(2),
                        BuildSocialIcon(
                            assetPath: AssetsData.google,
                            size: SizeConfig.defaultSize! * 3),
                        const HorizantalSpace(2),
                        BuildSocialIcon(
                            assetPath: AssetsData.insta,
                            size: SizeConfig.defaultSize! * 3),
                      ],
                    ),
                    const VerticalSpace(1.5),
                    Center(
                      child: GestureDetector(
                        onTap: () => GoRouter.of(context)
                            .pushReplacement(AppRouter.kSignUp),
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: GoogleFonts.inter(
                                fontSize: 16, color: Colors.grey),
                            children: [
                              TextSpan(
                                text: "Sign up",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpace(2)
                  ]))
        ],
      ),
    );
  }
}
