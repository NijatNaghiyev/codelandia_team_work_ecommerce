import 'package:hive_flutter/hive_flutter.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  await Hive.openBox('darkMode');
  await Hive.openBox('favoriteListBox');
  await Hive.openBox('cartListBox');
}
