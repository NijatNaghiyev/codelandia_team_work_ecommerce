import 'package:codelandia_team_work_ecommerce/screens/cart_screen.dart';
import 'package:codelandia_team_work_ecommerce/screens/discover_screen.dart';
import 'package:codelandia_team_work_ecommerce/screens/favorite_screen.dart';
import 'package:codelandia_team_work_ecommerce/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  bool visibleBottomBar = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        showNav();
      } else if (scrollController.position.pixels == 0) {
        showNav();
      } else {
        hideNav();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const DiscoverScreen();
    if (_currentIndex == 3) {
      activeScreen = const ProfileScreen(
        imageUrl:
            'https://images.yourstory.com/cs/2/96eabe90392211eb93f18319e8c07a74/Imagejtb7-1684960500563.jpg',
      );
    }
    if (_currentIndex == 2) {
      activeScreen = const CartScreen();
    }
    if (_currentIndex == 1) {
      activeScreen = const FavoriteScreen();
    }

    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: AnimatedCrossFade(
        crossFadeState: visibleBottomBar
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        sizeCurve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(milliseconds: 1000),
        secondChild: const SizedBox(),
        firstChild: BottomNavigationBar(
          elevation: 12,
          selectedItemColor: Colors.teal,
          selectedIconTheme: const IconThemeData(color: Colors.teal),
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
      ),
      floatingActionButton: !visibleBottomBar
          ? FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.linear);
              },
              child: const Icon(Icons.arrow_upward_outlined),
            )
          : null,
    );
  }

  void hideNav() {
    setState(() {
      visibleBottomBar = false;
    });
  }

  void showNav() {
    setState(() {
      visibleBottomBar = true;
    });
  }
}
