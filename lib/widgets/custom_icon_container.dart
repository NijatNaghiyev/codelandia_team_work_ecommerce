import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../hive/dark_mode.dart';
import '../screens/languages_screen.dart';
import '../screens/profile_screen.dart';

class CustomIconContainer extends StatefulWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const CustomIconContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  State<CustomIconContainer> createState() => _CustomIconContainerState();
}

class _CustomIconContainerState extends State<CustomIconContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: Get.width,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Icon(widget.icon, color: Colors.white),
            ),
            const SizedBox(width: 15),
            Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            widget.text == 'dark mode'.tr
                ? Switch(
                    activeColor: Colors.black,
                    value: isDarkModeBoolean,
                    onChanged: (value) {
                      setState(() {
                        isDarkModeBoolean = !Get.isDarkMode;
                      });

                      changeTheme();
                    },
                  )
                : widget.text == 'languages'.tr
                    ? const LanguagesFlagWidget()
                    : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class LanguagesFlagWidget extends StatelessWidget {
  const LanguagesFlagWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircleFlag(languageBool ? 'az' : 'us'),
      ),
    );
  }
}
