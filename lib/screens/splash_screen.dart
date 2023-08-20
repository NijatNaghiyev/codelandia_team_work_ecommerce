import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../generated/assets.dart';
import 'main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 400,
      centered: true,
      duration: 3550,
      splash: Lottie.asset(
        Assets.lottieSplashScreen2,
      ),
      nextScreen: const MainScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
