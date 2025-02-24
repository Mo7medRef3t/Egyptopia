import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/custom_fields.dart';
import 'package:egyptopia/core/widgets/reusable_screen.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:egyptopia/core/widgets/custom_buttons.dart';
import 'package:egyptopia/features/onbording/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
            child: Column(
              children: [
                const VerticalSpace(4),
                Text(
                  "Create New Password",
                  style: GoogleFonts.imFellFrenchCanon(
                    fontSize: SizeConfig.defaultSize! * 3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const VerticalSpace(2),
                const PageViewItem(
                  image: 'assets/images/new1.png',
                  title:
                      'Your new password must be different\nfrom previously used password',
                  subTitle: '',
                  titleFontSize: 18,
                  subTitleFontSize: 10,
                ),
                const CustomInputField(
                  label: "New Password",
                  hint: "Enter Your New Password",
                  inputType: TextInputType.visiblePassword,
                  isPassword: true,
                ),
                const VerticalSpace(2),
                const CustomInputField(
                  label: "Confirm Password",
                  hint: "Re-enter Your Password",
                  inputType: TextInputType.visiblePassword,
                  isPassword: true,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomGeneralButton(
                    text: "Confirm",
                    onTap: () {
                      GoRouter.of(context).pushReplacement(AppRouter.kSignIn);
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: SizeConfig.defaultSize! * 1.1,
            top: SizeConfig.defaultSize! * 2,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
