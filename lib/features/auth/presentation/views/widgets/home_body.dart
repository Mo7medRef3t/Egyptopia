import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/utils/assets.dart';
import 'package:egyptopia/core/constants.dart';
import 'package:egyptopia/core/widgets/reusable_screen.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      backgroundColor: kSecondaryColor,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(
            0, 255, 254, 254), // Transparent to show gradient
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Ensures all labels are visible
          selectedItemColor: const Color.fromARGB(255, 104, 67, 153),
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: "Discover"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: "Wishlist"),
            BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined), label: "Itinerary"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_pin_outlined), label: "Profile"),
          ],
        ),

        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min, // Prevents extra space
                    children: [
                      Image.asset(
                        AssetsData.fixedLogo,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // IconButton(
                      // icon: const Icon(Icons.language, color: Colors.white),
                      // onPressed: () {},
                      //),
                      IconButton(
                        icon: const Icon(Icons.notifications_none_outlined,
                            size: 27.5, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),

              const VerticalSpace(2),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search Places, Activities...",
                  hintStyle:
                      TextStyle(color: Colors.grey[500]), // Set hint text color
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.mic),
                  filled: true, // Enable background fill
                  fillColor: Colors.white, // Set background color to white
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        color: Colors.grey), // Border color when not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2), // Border color when focused
                  ),
                ),
              ),

              const VerticalSpace(1),

              // Recommended for You
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recommended for You",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {}, // Add navigation or action here
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.black,
                        shadows: [
                          Shadow(
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

              const SizedBox(height: 8),
              SizedBox(
                height: 200, // Adjust height to fit images fully
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8), // Prevents partial cuts
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: MediaQuery.of(context).size.width *
                          0.6, // Adjust width for full visibility
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage(AssetsData.dest),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const VerticalSpace(2),

              // Categories Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryIcon(
                      Icons.place, "Places", context, AppRouter.kPlaces),
                  _buildCategoryIcon(Icons.quiz_rounded, "Quizzes", context,
                      AppRouter.kQuizzes),
                  _buildCategoryIcon(
                      Icons.event, "Events", context, AppRouter.kEvents),
                  _buildCategoryIcon(
                      Icons.restaurant, "Food", context, AppRouter.kFood),
                  _buildCategoryIcon(Icons.directions_walk, "Activities",
                      context, AppRouter.kActivities),
                ],
              ),

              const VerticalSpace(1),

              // Discover Egypt
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Discover Egypt",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.black,
                        shadows: [
                          Shadow(
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
              SizedBox(
                height: 200, // Increased height slightly for better fit
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8), // Prevents partial cuts
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: MediaQuery.of(context).size.width *
                          0.3, // Ensures full visibility
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage(AssetsData.discover),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(
      IconData icon, String label, BuildContext context, String? route) {
    return GestureDetector(
      onTap: route != null ? () => GoRouter.of(context).push(route) : null,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blueGrey[100],
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
