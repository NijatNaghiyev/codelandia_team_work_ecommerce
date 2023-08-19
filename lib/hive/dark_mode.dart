import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

void initialTheme() {
  Get.changeTheme(
    Hive.box('darkMode').get('isDarkMode', defaultValue: true)
        ? ThemeData.light()
        : ThemeData.dark(),
  );
}

void changeTheme() {
  Get.changeTheme(
    Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
  );
  Hive.box('darkMode').put('isDarkMode', Get.isDarkMode);
}
