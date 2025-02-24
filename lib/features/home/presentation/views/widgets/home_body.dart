import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/utils/assets.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/build_category_icon.dart';
import 'package:egyptopia/core/widgets/custom_search.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:egyptopia/features/home/presentation/views/widgets/feature_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset(
            AssetsData.fixedLogo,
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined,
                size: 27.5, color: Colors.white),
            onPressed: () {},
          ),
        ]),
        const VerticalSpace(2),
        const CustomSearch(),
        const VerticalSpace(1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recommended For You",
              style: GoogleFonts.montserrat(
                  color: const Color(0xFF1F2544),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "See All",
                style: GoogleFonts.inter(
                  color: Colors.black,
                  shadows: [
                    const Shadow(
                      color: Colors.white, // Shadow color
                      offset: Offset(2, 2), // Position (x, y)
                      blurRadius: 4, // Blur effect
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const VerticalSpace(1),
        GestureDetector(
            onTap: () {},
            child: const FeatureSlider(imageAsset: AssetsData.dest)),
        const VerticalSpace(2),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildCategoryIcon(
              icon: Icons.place,
              label: "Places",
              route: AppRouter.kPlaces,
            ),
            BuildCategoryIcon(
                icon: Icons.quiz_rounded,
                label: "Quizzes",
                route: AppRouter.kQuizzes),
            BuildCategoryIcon(
              icon: Icons.event,
              label: "Events",
              route: AppRouter.kEvents,
            ),
            BuildCategoryIcon(
                icon: Icons.restaurant_menu, label: "Food", route: AppRouter.kFood),
            BuildCategoryIcon(
                icon: Icons.directions_walk,
                label: "Activities",
                route: AppRouter.kActivities),
          ],
        ),
        const VerticalSpace(1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Discover Egypt",
              style: GoogleFonts.montserrat(
                  color: const Color(0xFF1F2544),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "See All",
                style: GoogleFonts.inter(
                  color: Colors.black,
                  shadows: [
                    const Shadow(
                      color: Colors.white, // Shadow color
                      offset: Offset(2, 2), // Position (x, y)
                      blurRadius: 4, // Blur effect
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        FeatureSlider(
          imageAsset: AssetsData.discover,
          width: SizeConfig.screenWidth! * 0.3,
        )
      ],
    );
  }
}
