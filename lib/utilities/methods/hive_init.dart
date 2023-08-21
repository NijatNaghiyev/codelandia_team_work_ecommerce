import 'package:hive_flutter/hive_flutter.dart';

import '../../hive/dark_mode.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  await Hive.openBox('darkMode');
  await Hive.openBox('favoriteListBox');
  await Hive.openBox('cartListBox');
  await Hive.openBox('language');
  initialTheme(); // ? Dark mode
}
