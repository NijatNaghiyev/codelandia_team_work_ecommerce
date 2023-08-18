import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool languageBool = false;

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
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.deepOrange,
        title: Text('languages'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: SwitchListTile(
                activeColor: Colors.deepOrange,
                title: Text('english'.tr),
                value: !languageBool,
                onChanged: (bool value) {
                  setState(() {});
                  languageBool = !value;
                  languageBool == true
                      ? Get.updateLocale(const Locale('az'))
                      : Get.updateLocale(const Locale('en_US'));
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
              child: SwitchListTile(
                activeColor: Colors.deepOrange,
                title: Text('azerbaijani'.tr),
                value: languageBool,
                onChanged: (bool value) {
                  setState(() {});
                  languageBool = value;
                  languageBool == false
                      ? Get.updateLocale(const Locale('en_US'))
                      : Get.updateLocale(const Locale('az'));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
