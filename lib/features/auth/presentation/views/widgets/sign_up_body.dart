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

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

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
          Expanded(
            child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!),
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
                child: ListView(children: [
                  Text(" Sign up",
                      style: GoogleFonts.imFellFrenchCanon(
                          fontSize: 30, fontWeight: FontWeight.w500)),
                  const VerticalSpace(2),
                  const CustomInputField(
                      label: "Full Name", hint: "Enter Your Name"),
                  const VerticalSpace(1.5),
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
                  const VerticalSpace(1.5),
                  const Row(
                    children: [
                      Expanded(
                          child: CustomInputField(
                        label: "Country",
                        hint: "Select Country",
                        isCountryPicker: true,
                      )),
                      HorizantalSpace(2),
                      Expanded(
                          child: CustomInputField(
                        label: "Date Of Birth",
                        hint: "Select Date Of Birth",
                        isDatePicker: true,
                      ))
                    ],
                  ),
                  const VerticalSpace(1.5),
                  const CustomInputField(label: "Gender", hint: "Select Gender",isDropdown: true),
                  const VerticalSpace(2),
                  CustomGeneralButton(
                    text: "Sign up",
                    onTap: () {},
                  ),
                  SizedBox(height: SizeConfig.defaultSize!),
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
                          size: SizeConfig.defaultSize! * 4),
                      const HorizantalSpace(2),
                      BuildSocialIcon(
                          assetPath: AssetsData.google,
                          size: SizeConfig.defaultSize! * 4),
                      const HorizantalSpace(2),
                      BuildSocialIcon(
                          assetPath: AssetsData.twitter,
                          size: SizeConfig.defaultSize! * 4),
                    ],
                  ),
                  const VerticalSpace(1.5),
                  Center(
                    child: GestureDetector(
                      onTap: () => GoRouter.of(context).pushReplacement(AppRouter.kSignIn),
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: GoogleFonts.inter(
                              fontSize: 16, color: Colors.grey),
                          children: [
                            TextSpan(
                              text: "Sign in",
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
                ])),
          )
        ],
      ),
    );
  }
}
