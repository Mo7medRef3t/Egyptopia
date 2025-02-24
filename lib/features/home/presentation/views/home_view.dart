import 'package:egyptopia/core/constants.dart';
import 'package:egyptopia/core/utils/assets.dart';
import 'package:egyptopia/core/widgets/reusable_screen.dart';
import 'package:egyptopia/features/home/presentation/views/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReusableScreen(
      backgroundColor: kSecondaryColor,
        imageAsset: AssetsData.navBar, child: HomeBody());
  }
}
