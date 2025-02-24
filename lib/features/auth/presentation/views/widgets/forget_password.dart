import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/custom_fields.dart';
import 'package:egyptopia/core/widgets/reusable_screen.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:egyptopia/features/onbording/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:egyptopia/core/widgets/custom_buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
            child: Column(
              children: [
                const VerticalSpace(5),
                Text(
                  "Verify Your Email",
                  style: GoogleFonts.imFellFrenchCanon(
                    fontSize: SizeConfig.defaultSize! * 3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const VerticalSpace(3),
                 PageViewItem(
                  image: 'assets/images/forgot.png',
                  title: 'Enter your email address',
                  subTitle: 'We will verify this email is yours',
                  titleFontSize: SizeConfig.defaultSize! * 2.6,
                  subTitleFontSize: SizeConfig.defaultSize! * 1.6,
                ),
                const VerticalSpace(3),
                const CustomInputField(
                  label: "Email",
                  hint: "Enter Your Email",
                  inputType: TextInputType.emailAddress,
                ),
                const VerticalSpace(3),
                CustomGeneralButton(
                  text: "Send",
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kCreateNewPassword);
                  },
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
