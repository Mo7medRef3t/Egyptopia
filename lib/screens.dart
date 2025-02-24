import 'package:egyptopia/features/Itinerary/presentation/views/itinerary_view.dart';
import 'package:egyptopia/features/Profile/presentation/views/profile_view.dart';
import 'package:egyptopia/features/wishlist/presentation/views/wish_list_view.dart';
import 'package:flutter/material.dart';
import 'features/home/presentation/views/home_view.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const WishListView(),
    const ItineraryView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type:
                BottomNavigationBarType.fixed, // Ensures all labels are visible
            onTap: (val) {
              setState(() {
                _selectedIndex = val;
              });
            },
            currentIndex: _selectedIndex,
            iconSize: 25,
            selectedItemColor: const Color.fromARGB(255, 104, 67, 153),
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: "Discover"),
              BottomNavigationBarItem(
                  icon: Icon(_selectedIndex == 1
                      ? Icons.favorite
                      : Icons.favorite_border),
                  label: "Wishlist"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined), label: "Itinerary"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: "Profile")
            ]),
        body: _screens[_selectedIndex]);
  }
}
