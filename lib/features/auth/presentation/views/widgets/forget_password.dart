import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/custom_fields.dart';
import 'package:egyptopia/core/widgets/reusable_screen.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
        child: Column(
          children: [
            Container(),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const BackButton(
                  color: Colors.white,
                )),
            const CustomInputField(
                label: "Email",
                hint: "Enter Your Email",
                inputType: TextInputType.emailAddress),
          ],
        ),
      ),
    );
  }
}
