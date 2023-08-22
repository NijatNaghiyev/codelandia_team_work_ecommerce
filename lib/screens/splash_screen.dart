import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../generated/assets.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 400,
      centered: true,
      duration: 3550,
      splash: Column(
        children: [
          Expanded(
            flex: 2,
            child: Lottie.asset(
              Assets.lottieSplashScreen2,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
              width: Get.width,
              child: Center(
                child: DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('Shopify',
                          speed: const Duration(milliseconds: 500)),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      nextScreen: const MainScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
