import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

String selectedLanguage = Hive.box('language').get('language') == 'azerbaijan'
    ? 'azerbaijan'
    : 'english';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.teal,
        title: Text('languages'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: selectedLanguage == 'english' ? Colors.teal : null,
              child: ListTile(
                title: Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: CircleFlag('us'),
                    ),
                    const SizedBox(width: 10),
                    Text('english'.tr),
                  ],
                ),
                onTap: () {
                  Hive.box('language').put('language', 'english');
                  setState(() {});
                  selectedLanguage == 'english'
                      ? Get.updateLocale(const Locale('az'))
                      : Get.updateLocale(const Locale('en_US'));
                  selectedLanguage = 'english';
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: selectedLanguage == 'azerbaijan' ? Colors.teal : null,
              child: ListTile(
                title: Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: CircleFlag('az'),
                    ),
                    const SizedBox(width: 10),
                    Text('azerbaijani'.tr),
                  ],
                ),
                onTap: () {
                  Hive.box('language').put('language', 'azerbaijan');
                  setState(() {});
                  selectedLanguage == 'azerbaijan'
                      ? Get.updateLocale(const Locale('en_US'))
                      : Get.updateLocale(const Locale('az'));
                  selectedLanguage = 'azerbaijan';
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
