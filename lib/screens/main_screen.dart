import 'package:codelandia_team_work_ecommerce/screens/discover_screen.dart';
import 'package:codelandia_team_work_ecommerce/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const DiscoverScreen();
    if (_currentIndex == 3) {
      activeScreen = const ProfileScreen(
        imageUrl:
            'https://images.yourstory.com/cs/2/96eabe90392211eb93f18319e8c07a74/Imagejtb7-1684960500563.jpg',
      );
    }
    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 12,
        selectedItemColor: Colors.deepOrange,
        selectedIconTheme: const IconThemeData(color: Colors.deepOrange),
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {});
          _currentIndex = value;
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: 'discover'.tr),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite), label: 'favorite'.tr),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart), label: 'cart'.tr),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: 'profile'.tr),
        ],
      ),
    );
  }
}
