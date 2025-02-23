import 'package:egyptopia/core/constants.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/features/auth/presentation/views/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: SizeConfig.screenHeight! * 0.35,
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
          Positioned(
            left: SizeConfig.defaultSize!,
            top: SizeConfig.defaultSize! * 2,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          const SignInBody(),
        ],
      ),
    );
  }
}
