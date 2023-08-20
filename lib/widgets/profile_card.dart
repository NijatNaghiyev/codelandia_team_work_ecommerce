import 'package:codelandia_team_work_ecommerce/screens/languages_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../hive/dark_mode.dart';
import '../screens/profile_screen.dart';
import 'language_flag.dart';

class ProfileCardWidget extends StatefulWidget {
  const ProfileCardWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  State<ProfileCardWidget> createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          onTap: () {
            if (widget.text == 'languages') {
              Get.to(const LanguagesScreen());
            }
          },
          leading: Icon(
            widget.icon,
            color: Colors.teal,
          ),
          title: Text(
            widget.text.tr,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          trailing: widget.text == 'dark mode'
              ? Switch(
                  activeColor: Colors.teal,
                  value: isDarkModeBoolean,
                  onChanged: (value) {
                    setState(() {
                      isDarkModeBoolean = !Get.isDarkMode;
                    });

                    changeTheme();
                  },
                )
              : widget.text == 'languages'
                  ? const LanguagesFlagWidget()
                  : const SizedBox(),
        ),
      ),
    );
  }
}
