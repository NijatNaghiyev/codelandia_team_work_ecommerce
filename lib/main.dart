import 'package:codelandia_team_work_ecommerce/get_x/localization/messages.dart';
import 'package:codelandia_team_work_ecommerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hive/dark_mode.dart';
import 'utilities/methods/hive_init.dart';

Future<void> main() async {
  await hiveInit();
  initialTheme(); // ? Dark mode
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: const Locale('en_US'), // ? Translation
      fallbackLocale: const Locale('en_US'),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
