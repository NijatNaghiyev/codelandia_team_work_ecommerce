import 'package:codelandia_team_work_ecommerce/get_x/localization/messages.dart';
import 'package:codelandia_team_work_ecommerce/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'hive/dark_mode.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('darkMode');
  await Hive.openBox('favoriteListBox');
  await Hive.openBox('cartListBox');
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
      home: const MainScreen(),
    );
  }
}
