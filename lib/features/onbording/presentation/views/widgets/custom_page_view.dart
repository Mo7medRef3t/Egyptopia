import 'package:flutter/material.dart';

import 'page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          image: "assets/images/page view 1.png",
          title: "Start Exploring Today",
          subTitle:
              "Dive into unforgettable experiences \nand make your Egyptian dreams a\n reality",
        ),
        PageViewItem(
          image: "assets/images/page view 2.png",
          title: "Plan Effortlessly",
          subTitle:
              "From personalized itineraries to expert \ntravel tips, we make exploring Egypt simple and stress-free.",
        ),
        PageViewItem(
          image: "assets/images/page view 3.png",
          title: "Experience More",
          subTitle:
              "Discover local favorites, cultural\n treasures, and breathtaking \nadventures",
        ),
      ],
    );
  }
}
