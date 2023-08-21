import 'package:codelandia_team_work_ecommerce/get_x/localization/messages.dart';
import 'package:codelandia_team_work_ecommerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'utilities/methods/hive_init.dart';

Future<void> main() async {
  await hiveInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Hive.box('language').get('language', defaultValue: 'language') ==
              'azerbaijan'
          ? const Locale('az')
          : const Locale('en_US'), // ? Translation
      fallbackLocale: const Locale('en_US'),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
